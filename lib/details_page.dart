import 'package:belajargetx2/model/request_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final RequestModel model;

  DetailPage({@required this.model});

  @override
  Widget build(BuildContext context) {
    String amount =
        NumberFormat.currency(locale: 'id', symbol: 'RP. ', decimalDigits: 0)
            .format(model.amount);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Claim",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username : ${model.username}"),
            SizedBox(height: 8),
            Text("Claim date : ${model.claimDate}"),
            SizedBox(height: 8),
            Text("Amount : $amount"),
            SizedBox(height: 8),
            Text("Claim type : ${model.typeClaim}"),
            SizedBox(height: 8),
            Text("Description : ${model.description }"),
          ],
        ),
      ),
    );
  }
}
