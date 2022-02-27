import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medbuddy/prescriptions/prescription_desc.dart';
import 'dart:convert';
import 'package:medbuddy/prescriptions/prescription.dart';
/*
void main(List<String> args) {
  runApp(const Prescriptions());
}*/

//ListView for all prescriptions
class Prescriptions extends StatefulWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Prescriptions",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/data/medicine_data.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemBuilder: (context, index) {
              Prescription profile = Prescription(
                  newData[index]['name'],
                  newData[index]['description'],
                  newData[index]['image'],
                  newData[index]['schedule'],
                  newData[index]['start_date'],
                  newData[index]['end_date']);
              var random = Random();
              var buttonColorList = [
                Colors.lightGreenAccent,
                Colors.cyanAccent,
                Colors.deepOrange,
                Colors.limeAccent,
                Colors.yellow,
              ];
              return Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PresDesc(
                          profile: profile,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        profile.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: "Lato",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        profile.schedule,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttonColorList[
                          random.nextInt(buttonColorList.length)],
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.horizontal(),
                      )),
                ),
                color: buttonColorList[random.nextInt(buttonColorList.length)],
                width: 500,
                height: 200,
              );
            },
            itemCount: newData == null ? 0 : newData.length,
          );
        },
      ),
    );
  }
}
