import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Page1 extends StatefulWidget {
  static final String TAG = '/page1';

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<dynamic> dummy = [
    {
      "idClaim": "8",
      "nik": "0",
      "typeclaim": "Kesehatan",
      "amount": "500",
      "description": "test",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "9",
      "nik": "0",
      "typeclaim": "Parkir",
      "amount": "200",
      "description": "test2",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "10",
      "nik": "0",
      "typeclaim": "Parkir",
      "amount": "200",
      "description": "test lagi",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "11",
      "nik": "0",
      "typeclaim": "Education",
      "amount": "4",
      "description": "test",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "12",
      "nik": "0",
      "typeclaim": "Kesehatan",
      "amount": "200",
      "description": "test",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "13",
      "nik": "0",
      "typeclaim": "Education",
      "amount": "300",
      "description": "test lagi",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "14",
      "nik": "0",
      "typeclaim": "Kesehatan",
      "amount": "300",
      "description": "test lagi",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "15",
      "nik": "0",
      "typeclaim": "Parkir",
      "amount": "200000",
      "description": "parkir bulanan perio",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "16",
      "nik": "0",
      "typeclaim": "parkir",
      "amount": "200",
      "description": "testpostman",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "17",
      "nik": "0",
      "typeclaim": "Parkir",
      "amount": "200",
      "description": "test lagi",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "18",
      "nik": "0",
      "typeclaim": "Parkir",
      "amount": "200",
      "description": "test",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "19",
      "nik": "0",
      "typeclaim": "Parkir",
      "amount": "13232",
      "description": "test lagi aja",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "20",
      "nik": "0",
      "typeclaim": "Education",
      "amount": "200",
      "description": "test lagi",
      "tglPengajuan": "2021-08-30 00:00:00",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "21",
      "nik": "0",
      "typeclaim": "Education",
      "amount": "700",
      "description": "bekas parkir",
      "tglPengajuan": "2021-08-30 20:46:06",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "23",
      "nik": null,
      "typeclaim": "Education",
      "amount": "50000",
      "description": "test31agus",
      "tglPengajuan": "2021-08-31 10:04:12",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "24",
      "nik": null,
      "typeclaim": "Parkir",
      "amount": "200",
      "description": "just dummy",
      "tglPengajuan": "2021-08-31 13:02:51",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "27",
      "nik": null,
      "typeclaim": "kesehatan",
      "amount": "5777",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      "tglPengajuan": "2021-08-32 19:59:40",
      "evidence": null,
      "statusPengajuan": null
    },
    {
      "idClaim": "28",
      "nik": null,
      "typeclaim": "kesehatan",
      "amount": "6000",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "tglPengajuan": "2021-08-32 20:11:27",
      "evidence": null,
      "statusPengajuan": null
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = dummy.map((e) => _SalesData.fromJson(e)).toList()
      ..sort((a, b) => a.amount.compareTo(b.amount));

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 400,
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
            title: ChartTitle(text: 'Claim'),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              ColumnSeries<_SalesData, String>(
                dataSource: data,
                pointColorMapper: (_SalesData sales, _) => Colors.green,
                xValueMapper: (_SalesData sales, _) =>
                    sales.date.toString().substring(0, 10),
                yValueMapper: (_SalesData sales, _) => sales.amount,
                sortingOrder: SortingOrder.ascending,
                sortFieldValueMapper: (_SalesData sales, _) => sales.date,
                dataLabelSettings: DataLabelSettings(isVisible: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.date, this.amount);

  DateTime date;
  int amount;

  _SalesData.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['tglPengajuan']);
    amount = int.parse(json['amount']);
  }
}
