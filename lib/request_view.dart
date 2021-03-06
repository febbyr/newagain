// import 'package:belajargetx2/details_page.dart';
import 'package:belajargetx2/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:belajargetx2/model/request_model.dart';

class RequestView extends StatefulWidget {
  const RequestView({Key key}) : super(key: key);

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final Uri CARD_URL =
      Uri.parse("https://syclara.qmuaji.com/connectdb/getdata.php");
  List<RequestModel> requestview;

  @override
  void initState() {
    super.initState();
  }

  Future<List<RequestModel>> _fetchData() async {
    try {
      var jsonResponse = await http.get(CARD_URL);
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

        requestview = jsonItems.map<RequestModel>((json) {
          return RequestModel.fromJson(json);
        }).toList();
      }
    } catch (e) {}
    return requestview;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_requestview) {
      setState(() => requestview = _requestview);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Claim",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<RequestModel>>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: SpinKitFadingCircle(
                    size: 45,
                    color: Colors.blueAccent,
                  ),
                );
              return Container(
                margin: EdgeInsets.only(bottom: 0.0),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  itemBuilder: (context, index) {
                    RequestModel data = snapshot.data[index];

                    return InkWell(
                      onTap: () {
                        Get.to(DetailPage(model: data));
                      },
                      child: Column(
                        children: [
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.request_page_rounded,
                                    size: 50,
                                  ),
                                  title: Text(
                                    '${data.username} (${data.typeClaim})',
                                  ),
                                  subtitle: Text(data.claimDate.toString()),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
