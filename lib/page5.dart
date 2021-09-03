import 'package:belajargetx2/request_view.dart';
import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  static final String TAG = '/page5';

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestView(),
    );
  }
}
