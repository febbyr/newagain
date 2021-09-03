//landing page
import 'package:belajargetx2/page1.dart';
import 'package:belajargetx2/page2.dart';
import 'package:flutter/material.dart';

import 'page5.dart';
import 'page2.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [Page1(), Page5()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Page2.TAG);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                icon: Icon(Icons.home, color: Colors.grey),
                title: Text("Home",
                    style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.red
                          : Colors.grey,
                    ))),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.assignment,
                  color: Colors.red,
                ),
                icon: Icon(Icons.assignment, color: Colors.grey),
                title: Text("List Claim",
                    style: TextStyle(
                      color: _bottomNavCurrentIndex == 1
                          ? Colors.red
                          : Colors.grey,
                    ))),
          ],
        ),
      ),
    );
  }
}
