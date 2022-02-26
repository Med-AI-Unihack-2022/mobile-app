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
    prefs.clear();
    Navigator.of(context).pop();
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
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
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dashboard()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Medical Records'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MedicalRecords()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Prescriptions'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('Scan QR Code'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRCodePage()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Import/Export Medical Record'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => {logout(context)},
          ),
        ],
      ),
    );
  }
}
