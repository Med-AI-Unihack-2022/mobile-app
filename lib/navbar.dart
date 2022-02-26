import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medbuddy/dashboard.dart';
import 'package:medbuddy/home.dart';
import 'package:medbuddy/medicalRecords.dart';
import 'package:medbuddy/onboarding.dart';
import 'package:medbuddy/qrcode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  void logout(BuildContext context) async {
    EasyLoading.show(status: 'Logging out...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.of(context).pop();
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
      prefs.clear();
      SystemNavigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dashboard()))
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Medical Records'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MedicalRecords()))
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Prescriptions'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text('Scan QR Code'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRCodePage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Import/Export Medical Record'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => {logout(context)},
          ),
        ],
      ),
    );
  }
}
