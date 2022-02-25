import 'package:flutter/material.dart';
import 'sign_up.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        //Need to use another context here for navigation, check this link: https://stackoverflow.com/questions/44004451/navigator-operation-requested-with-a-context-that-does-not-include-a-navigator
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: const Text("MEDBUDDY"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Image
                Image.asset('assets/img/medred_ic.png'),
                //First button
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigate to sign up screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  width: 300,
                  height: 50,
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigate to login screen
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  width: 300,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
