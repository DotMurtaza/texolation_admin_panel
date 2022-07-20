import 'dart:async';

import 'package:admin_taxolution/AdminView/SeeMore/admin_login.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:flutter/material.dart';

class AdminWelcome extends StatefulWidget {
  const AdminWelcome({Key key}) : super(key: key);

  @override
  _AdminWelcomeState createState() => _AdminWelcomeState();
}

class _AdminWelcomeState extends State<AdminWelcome> {
  @override
  void initState() {
    //Get.put(AdminController());
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginDemo();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/admin.png'),
          SizedBox(
            height: SizeConfig.heightMultiplier * 5,
          ),
          const Text(
            'Welcome Admin',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 5,
          ),
          const CircularProgressIndicator()
        ],
      )),
    );
  }
}
