import 'dart:convert';

import 'package:belajargetx2/sign_in_page.dart';
import 'package:belajargetx2/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class Page1 extends StatefulWidget {
  static final String TAG = '/page1';

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<ClaimModel> data = [];
  int userTotal = 0;
  String totalClaim = "";
  bool loading = true;
  bool loading1 = true;
  bool loading2 = true;

  @override
  void initState() {
    super.initState();
    getTotal();
    getTotalClaim();
    getData();
  }

  Future getTotal() async {
    try {
      Uri url = Uri.parse(
          "https://syclara.qmuaji.com/connectdb/count_user_claim.php");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = json.decode(response.body);

        setState(() {
          userTotal = int.parse(body[0]['count(*)']);
          loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future getTotalClaim() async {
    try {
      Uri url =
          Uri.parse("https://syclara.qmuaji.com/connectdb/total_claim.php");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = json.decode(response.body);

        setState(() {
          totalClaim = NumberFormat.currency(
            locale: 'id',
            symbol: 'Rp. ',
            decimalDigits: 0,
          ).format(int.parse(body[0]['SUM(totalamount)']));
          loading1 = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future getData() async {
    try {
      Uri url =
          Uri.parse("https://syclara.qmuaji.com/connectdb/getdataclaim.php");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        Iterable body = json.decode(response.body);

        setState(() {
          data = body.map((e) => ClaimModel.fromJson(e)).toList()
            ..sort((a, b) => a.amount.compareTo(b.amount));
          loading2 = false;
        });
        print(data.map((e) => e.date));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/logo.png",
              width: 40,
            ),
            Text(
              "Syclara",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Pref.clear("sesi");
              Pref.clear("username");
              Get.offNamedUntil(SignInPage.TAG, ModalRoute.withName(Page1.TAG));
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: loading || loading1 || loading2
            ? Center(
                child: SpinKitFadingCircle(
                  size: 45,
                  color: Colors.blueAccent,
                ),
              )
            : ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          color: Colors.black.withAlpha(40),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelRotation: -90,
                        interval: 1,
                      ),
                      primaryYAxis: NumericAxis(
                        numberFormat: NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp. ',
                          decimalDigits: 0,
                        ),
                      ),
                      title: ChartTitle(text: 'Summary Claim'),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<ClaimModel, String>>[
                        ColumnSeries<ClaimModel, String>(
                          dataSource: data,
                          pointColorMapper: (ClaimModel sales, _) =>
                              Colors.green,
                          xValueMapper: (ClaimModel sales, _) =>
                              sales.date.toString().substring(0, 10),
                          yValueMapper: (ClaimModel sales, _) => sales.amount,
                          sortingOrder: SortingOrder.ascending,
                          sortFieldValueMapper: (ClaimModel sales, _) =>
                              sales.date,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          color: Colors.black.withAlpha(40),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Claim Info"),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(20),
                                    blurRadius: 10,
                                    offset: Offset.zero,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$userTotal"),
                                  SizedBox(height: 8),
                                  Text("Total User Claim"),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(20),
                                    blurRadius: 10,
                                    offset: Offset.zero,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$totalClaim"),
                                  SizedBox(height: 8),
                                  Text("Total Claim"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class ClaimModel {
  ClaimModel(this.date, this.amount);

  DateTime date;
  int amount;

  ClaimModel.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['claimDate']);
    amount = int.parse(json['totalAmount']);
  }
}
