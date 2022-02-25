// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

final fNameController = TextEditingController();
final lNameController = TextEditingController();
final ageController = TextEditingController();
String dropdownValue = 'Gender';
final heightController = TextEditingController();
final weightController = TextEditingController();
bool smoking = false;
bool alcohol = false;
bool physicalActivity = false;

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    const logo = Image(
      image: AssetImage('assets/logo.png'),
      height: 100,
      width: 100,
    );

    var firstName = TextField(
      controller: fNameController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    var lastName = TextField(
      controller: lNameController,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    var age = TextField(
      controller: ageController,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Age',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    var gender = DropdownButtonFormField<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Age',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Gender', 'Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    var height = TextField(
      controller: heightController,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Height (cm)',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    var weight = TextField(
      controller: weightController,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Weight (kg)',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    var smokingCheck = Row(
      children: <Widget>[
        Text(
          'Smoking: ',
          style: TextStyle(fontSize: 20),
        ),
        Checkbox(
          value: smoking,
          onChanged: (bool? value) {
            setState(() {
              smoking = true;
            });
          },
        ),
        Text('Yes', style: TextStyle(fontSize: 18)),
        SizedBox(width: 10),
        Checkbox(
          value: !smoking,
          onChanged: (bool? value) {
            setState(() {
              smoking = false;
            });
          },
        ),
        Text('No', style: TextStyle(fontSize: 18)),
      ],
    );

    var alcoholCheck = Row(
      children: <Widget>[
        Text(
          'Alcohol: ',
          style: TextStyle(fontSize: 20),
        ),
        Checkbox(
          value: alcohol,
          onChanged: (bool? value) {
            setState(() {
              alcohol = true;
            });
          },
        ),
        Text('Yes', style: TextStyle(fontSize: 18)),
        SizedBox(width: 10),
        Checkbox(
          value: !alcohol,
          onChanged: (bool? value) {
            setState(() {
              alcohol = false;
            });
          },
        ),
        Text('No', style: TextStyle(fontSize: 18)),
      ],
    );

    var physicalActivityCheck = Row(
      children: <Widget>[
        Text(
          'Physical Activity: ',
          style: TextStyle(fontSize: 20),
        ),
        Checkbox(
          value: physicalActivity,
          onChanged: (bool? value) {
            setState(() {
              physicalActivity = true;
            });
          },
        ),
        Text('Yes', style: TextStyle(fontSize: 18)),
        SizedBox(width: 10),
        Checkbox(
          value: !physicalActivity,
          onChanged: (bool? value) {
            setState(() {
              physicalActivity = false;
            });
          },
        ),
        Text('No', style: TextStyle(fontSize: 18)),
      ],
    );

    final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {},
        padding: EdgeInsets.all(12),
        color: Colors.black,
        child: Text('Continue',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Please fill in this form below',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            logo,
            const SizedBox(height: 10.0),
            firstName,
            const SizedBox(height: 10.0),
            lastName,
            const SizedBox(height: 10.0),
            age,
            const SizedBox(height: 10.0),
            gender,
            const SizedBox(height: 10.0),
            height,
            const SizedBox(height: 10.0),
            weight,
            const SizedBox(height: 10.0),
            smokingCheck,
            const SizedBox(height: 10.0),
            alcoholCheck,
            const SizedBox(height: 10.0),
            physicalActivityCheck,
            const SizedBox(height: 10.0),
            signupButton,
          ],
        ),
      ),
    );
  }
}
