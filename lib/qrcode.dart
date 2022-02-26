// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

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

  @override
  void initState() {
    super.initState();
    status = "Not Connected";
    scanResult = "";
  }

  void _scanQR() async {
    setState(() {
      status = "Connecting...";
    });
    try {
      String? result = await scanner.scan();
      setState(() {
        scanResult = result!;
        status = "Connected";
      });
    } on Exception catch (e) {
      setState(() {
        status = "Not Connected";
      });
    }
  }

  Widget scanButton() {
    return Padding(
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
            statusText(),
            const SizedBox(height: 10),
            scanButton(),
          ],
        ),
      ),
    );
  }
}
