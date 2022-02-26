import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medbuddy/med_report/med_report.dart';
import 'package:medbuddy/med_report/med_report_desc.dart';
/*
void main(List<String> args) {
  runApp(const MedReports());
}*/

class MedReports extends StatefulWidget {
  const MedReports({Key? key}) : super(key: key);

  @override
  _MedReportsState createState() => _MedReportsState();
}

class _MedReportsState extends State<MedReports> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Medical Records"),
          ),
          body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data/medical_record.json'),
            builder: (context, snapshot) {
              var newData = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (context, index) {
                  CheckUpData data = CheckUpData('', '', '', '');
                  if (newData[index]['appointmentType'] ==
                      "General Consultation") {
                    data = CheckUpData(
                      newData[index]['checkup']['systolic'],
                      newData[index]['checkup']['diastolic'],
                      newData[index]['checkup']['cholesterol'],
                      newData[index]['checkup']['glucose'],
                    );
                  }
                  MedReport medReport = MedReport(
                      newData[index]['date'],
                      newData[index]['time'],
                      newData[index]['location'],
                      newData[index]['appointmentType'],
                      newData[index]['doctor'],
                      data,
                      newData[index]['remarks'],
                      newData[index]['files'],
                      newData[index]['diagnosis']);
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
                            builder: (context) => MedReportDesc(
                              medReport: medReport,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            medReport.date,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Lato",
                            ),
                          ),
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
                    color:
                        buttonColorList[random.nextInt(buttonColorList.length)],
                    width: 500,
                    height: 200,
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
