import 'package:flutter/material.dart';
import 'package:medbuddy/med_report/med_report.dart';

class MedReportDesc extends StatefulWidget {
  final MedReport medReport;

  const MedReportDesc({Key? key, required this.medReport}) : super(key: key);

  @override
  _MedReportDescState createState() => _MedReportDescState();
}

class _MedReportDescState extends State<MedReportDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.medReport.appointmentType + " report",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Time: " + widget.medReport.time + " " + widget.medReport.date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 20,
              ),
            ),
            Text(
              "Location: " + widget.medReport.location,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 20,
              ),
            ),
            Text(
              "Doctor: " + widget.medReport.doctor,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 20,
              ),
            ),
            if (widget.medReport.checkup.cholesterol != '')
              Text(
                "Cholesterol: " + widget.medReport.checkup.cholesterol,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
            if (widget.medReport.checkup.diastolic != '')
              Text(
                "Diastolic: " + widget.medReport.checkup.diastolic,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
            if (widget.medReport.checkup.glucose != '')
              Text(
                "Glucose: " + widget.medReport.checkup.glucose,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
            if (widget.medReport.checkup.systolic != '')
              Text(
                "Systolic: " + widget.medReport.checkup.systolic,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 20,
                ),
              ),
            Text(
              "Remarks: " + widget.medReport.remarks,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 20,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Image.network(widget.medReport.files[index]);
                },
                itemCount: widget.medReport.files.length,
              ),
            ),
            Text(
              widget.medReport.diagnosis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
