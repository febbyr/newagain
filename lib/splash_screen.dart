import 'package:belajargetx2/landing_page.dart';
import 'package:belajargetx2/sign_in_page.dart';
import 'package:belajargetx2/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static final String TAG = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var sesi = await Pref.getBool("sesi");

      if (sesi != null) {
        Get.offAll(LandingPage());
      } else {
        Get.offAllNamed(SignInPage.TAG);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
