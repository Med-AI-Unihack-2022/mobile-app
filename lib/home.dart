// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medbuddy/dashboard.dart';
import 'sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();

class _HomeState extends State<Home> {
  void signIN() async {
    var username = usernameController.text.toString().replaceAll(" ", "");
    var password = passwordController.text.toString().replaceAll(" ", "");
    EasyLoading.show(status: 'Loading...');
    if (username == "" || password == "") {
      EasyLoading.dismiss();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Please fill all the fields"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      var response = await http.post(Uri.parse(
          "http://119.91.29.100:8000/patients/signin?username=$username&password=$password"));
      var jsonData = json.decode(response.body);
      try {
        var test = jsonData["authentication_token"];
      } catch (e) {
        print(e);
        EasyLoading.dismiss();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Invalid username or password"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
      final prefs = await SharedPreferences.getInstance();
      print(jsonData["authentication_token"]);
      await prefs.setString('auth_token', jsonData["authentication_token"]);

      EasyLoading.dismiss();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: [
            //Image
            Image.asset('assets/img/medred_ic.png'),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Username',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  signIN();
                },
                padding: const EdgeInsets.all(12),
                color: Colors.black,
                child: const Text('Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),

            //First button
            // SizedBox(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       //Navigate to sign up screen
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const SignUp()));
            //     },
            //     child: const Text(
            //       "Sign Up",
            //       style: TextStyle(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            //   width: 300,
            //   height: 50,
            // ),
            // SizedBox(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       //Navigate to login screen
            //     },
            //     child: const Text(
            //       "Log In",
            //       style: TextStyle(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            //   width: 300,
            //   height: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
