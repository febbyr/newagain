import 'dart:convert';

import 'package:belajargetx2/landing_page.dart';
import 'package:belajargetx2/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class SignInPage extends StatefulWidget {
  static final String TAG = '/SignInPage';
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Future SignInPage() async {
      Uri ADD_URL = Uri.parse("https://syclara.qmuaji.com/connectdb/login.php");
      var response = await http.post(ADD_URL, body: {
        "username": usernameController.text,
        "password": passwordController.text,
      });
      var data = json.decode(response.body);
      if (data == "success") {
        Pref.set("username", usernameController.text);
        Pref.setBool("sesi", true);

        Toast.show("Login successful", context,
            gravity: Toast.CENTER,
            duration: 2,
            backgroundColor: Colors.greenAccent);
        print("login successful");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(),
          ),
        );
      } else {
        Toast.show("username or password incorrect!", context,
            gravity: Toast.CENTER,
            duration: 2,
            backgroundColor: Colors.redAccent);
        print("login failed");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(
                "assets/logo.png",
                width: 180,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(14, 26, 14, 6),
                child: Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'type your username'),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(14, 26, 14, 6),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: Stack(
                  children: [
                    TextField(
                      controller: passwordController,
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'type your password',
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: isLoading
                    ? SpinKitFadingCircle(
                        size: 45,
                        color: Colors.amber,
                      )
                    : RaisedButton(
                        onPressed: () {
                          SignInPage();
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.black,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
