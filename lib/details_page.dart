import 'package:belajargetx2/model/request_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final RequestModel model;

  DetailPage({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Details Page"),
      ),
      body: Center(
        child: Text("${model.userid}"),
      ),
    );
  }
}
