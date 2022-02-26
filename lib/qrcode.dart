// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';

class QRCodePage extends StatefulWidget {
  QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

GlobalKey<ScaffoldState> _key = GlobalKey();

class _QRCodePageState extends State<QRCodePage> {
  String status = "";
  String scanResult = "";
  bool isConnected = false;
  String docName = "";

  @override
  void initState() {
    super.initState();
    status = "Not Connected";
    scanResult = "";
    docName = "";
  }

  void _scanQR() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = "Connecting...";
    });
    try {
      String? result = await scanner.scan();
      setState(() {
        scanResult = result!;
        status = "Verifying connection...";
      });
      var qrCodeToken = result!.split(",")[1];
      var userToken = prefs.getString("auth_token");
      var response = await http.get(Uri.parse(
          "http://119.91.29.100:8000/qr_codes/verify?patient_token=$userToken&qr_code_token=$qrCodeToken"));
      print(response.body);
      var jsonBody = json.decode(response.body);
      var doctorName = jsonBody["first_name"] + " " + jsonBody["last_name"];
      setState(() {
        status = "Awaiting authorisation...";
      });
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Connection Request",
        desc: "MEDBUDDY is requesting permission to connect with $doctorName",
        buttons: [
          DialogButton(
            child: Text(
              "Accept",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {
              Navigator.pop(context),
              setState(() {
                status = "Connected";
                isConnected = true;
                doctorName = doctorName;
                docName = doctorName;
              })
            },
            color: Colors.green,
          ),
          DialogButton(
            child: Text(
              "Reject",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {
              Navigator.pop(context),
              setState(() {
                status = "Not Connected";
                isConnected = false;
              })
            },
            color: Colors.red,
          )
        ],
      ).show();
    } on Exception catch (e) {
      setState(() {
        status = "Not Connected";
      });
    }
  }

  Widget connectedSyncAnimation() {
    return isConnected ? Image.asset("assets/syncing.gif") : Container();
  }

  Widget scanButton() {
    return isConnected
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: _scanQR,
              padding: const EdgeInsets.all(12),
              color: Colors.black,
              child: const Text('Scan QR Code',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          );
  }

  Widget disconnectButton() {
    return isConnected
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                setState(() {
                  status = "Not Connected";
                  isConnected = false;
                });
              },
              padding: const EdgeInsets.all(12),
              color: Colors.black,
              child: const Text('Disconnect',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          )
        : Container();
  }

  Widget statusText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        'Status: ' + status,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'Connect to a health provider',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            connectedSyncAnimation(),
            const SizedBox(height: 30),
            statusText(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Provider: ' + docName,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            scanButton(),
            disconnectButton(),
          ],
        ),
      ),
    );
  }
}
