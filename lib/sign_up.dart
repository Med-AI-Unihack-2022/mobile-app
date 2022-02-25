import 'package:flutter/material.dart';

/*
void main(List<String> args) {
  runApp(const SignUp());
}*/

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.red,
            child: const Text("Sign Up"),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Google sign-up button
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Sign up with Google"),
                  ),
                  width: 300,
                  height: 50,
                ),
                const SizedBox(height: 15),
                const Text("Or"),
                const SizedBox(height: 15),

                //Name field
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                ),
                const SizedBox(height: 15),

                //Email field
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),

                //Password field
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),

                //Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (newVal) {},
                    ),
                    const Text("Terms and Condition"),
                  ],
                ),
                const SizedBox(height: 15),

                //Sign up button
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Sign up"),
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
