// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'sign_up.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();

class _HomeState extends State<Home> {
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
                onPressed: () {},
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
