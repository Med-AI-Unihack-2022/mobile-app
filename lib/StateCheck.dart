import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateCheck extends StatefulWidget {
  StateCheck({Key? key}) : super(key: key);

  @override
  State<StateCheck> createState() => _StateCheckState();
}

void checkLogin(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getString("authentication_token") != "";
  if (isLoggedIn) {
    Navigator.pushReplacementNamed(context, '/dashboard');
  } else {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

class _StateCheckState extends State<StateCheck> {
  @override
  Widget build(BuildContext context) {
    checkLogin(context);
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
