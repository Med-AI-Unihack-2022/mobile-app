import 'package:flutter/material.dart';
import 'package:medbuddy/prescriptions/prescription.dart';

//Widget for only one specific, chosen prescription from the ListView.
class PresDesc extends StatefulWidget {
  final Prescription profile;

  const PresDesc({Key? key, required this.profile}) : super(key: key);

  @override
  _PresDescState createState() => _PresDescState();
}

class _PresDescState extends State<PresDesc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            widget.profile.name,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Indication: " + widget.profile.desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Lato",
                ),
              ),
              Text(
                "Dosage: " + widget.profile.schedule,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Lato",
                ),
              ),
              Text(
                "MFG date: " + widget.profile.startDate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Lato",
                ),
              ),
              Text(
                "EXP date: " + widget.profile.endDate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Lato",
                ),
              ),
              Image.network(
                widget.profile.image,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Set reminder",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 15,
                    ),
                  ),
                ),
                width: 300,
                height: 50,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Add to calendar",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 15,
                    ),
                  ),
                ),
                width: 300,
                height: 50,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }
}
