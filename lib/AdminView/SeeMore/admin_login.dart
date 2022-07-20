import 'package:admin_taxolution/AdminView/admin_main.dart';
import 'package:admin_taxolution/Widget/size_config.dart';
import 'package:admin_taxolution/Widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  RxBool isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Login Page"),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: SizeConfig.heightMultiplier * 30),
              Center(
                child: InputField(
                  controller: emailController,
                  labelText: "Email",
                  keyBoardType: "email",
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),

              Center(
                child: InputField(
                  controller: passwordController,
                  labelText: "Password",
                  keyBoardType: "password",
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),

              Obx(
                () => Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async {
                      isLoading.value = true;
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text)
                            .then((value) {
                          isLoading.value = true;

                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AdminMain()));
                        });
                      } catch (e) {
                        isLoading.value = false;

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                    child: Text(
                      isLoading.value == true ? "Loading..." : 'Login',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              )

              // SizedBox(
              //   height: 130,
              // ),
              // Text('New User? Create Account')
            ],
          ),
        ),
      ),
    );
  }
}
