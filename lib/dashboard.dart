import 'package:flutter/material.dart';
import 'package:medbuddy/navbar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

GlobalKey<ScaffoldState> _key = GlobalKey();

var _isLoading = false;
var name = "Unihack";

class _DashboardState extends State<Dashboard> {
  var welcomeTitle = Row(
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Welcome back,",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          Text(name + "!",
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        ],
      ),
      const SizedBox(
        width: 20.0,
      ),
    ],
  );

  var progressAndStatistics = Container(
    decoration: const BoxDecoration(
        border: Border(
      top: BorderSide(width: 2.0, color: Colors.black),
    )),
    child: Column(
      children: <Widget>[
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: <Widget>[
            const SizedBox(
              width: 20.0,
            ),
            CircularPercentIndicator(
              radius: 145.0,
              lineWidth: 5.0,
              percent: 0.8,
              center: const Text(
                "80%",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              progressColor: Colors.green,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: const Divider(
                    color: Colors.black,
                    height: 10,
                  )),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Heart Rate: 80 bpm",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Calories lost: 220 cal",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Blood Pressure: 120/80",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            welcomeTitle,
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Health Score",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 100.0),
                Text(
                  "Statistics",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            progressAndStatistics,
          ],
        ),
      ),
    );
  }
}
