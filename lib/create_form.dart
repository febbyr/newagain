import 'dart:ui';

import 'package:belajargetx2/landing_page.dart';
import 'package:belajargetx2/service/claim_service.dart';
import 'package:belajargetx2/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:belajargetx2/model/claim_model.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({Key key}) : super(key: key);

  @override
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  String username = "";
  int selectedPerson = null;
  List<Person> persons = [
    Person("Kesehatan", 402),
    Person("Parkir", 403),
    Person("Education", 401)
  ];
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];
    for (var item in persons) {
      items.add(
        DropdownMenuItem<int>(
          child: Text(item.name),
          value: item.value,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future getUsername() async {
    String data = await Pref.get("username");

    setState(() {
      username = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    add(ClaimModel claimModel) async {
      await ClaimService().addClaim(claimModel).then((success) {
        Toast.show(
          "add successful",
          context,
          gravity: Toast.CENTER,
          duration: 2,
        );
        Get.offAll(LandingPage());
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Input your Claim here",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16),
          child: Text("Claim Type"),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)),
          child: DropdownButton(
            isExpanded: true,
            hint: Text("select type of claim"),
            underline: SizedBox(),
            value: selectedPerson,
            items: generateItems(persons),
            onChanged: (item) {
              setState(() {
                selectedPerson = item;
              });
            },
          ),
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16),
          child: Text("Total Amount"),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: amount,
            decoration: InputDecoration(
              hintText: "Amount",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16),
          child: Text("Description"),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)),
          child: TextField(
            controller: description,
            decoration: InputDecoration(
              hintText: "type description about your claim",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () async {
            if (amount.text.isEmpty ||
                description.text.isEmpty ||
                selectedPerson == null) {
              Toast.show("This field is required", context,
                  gravity: Toast.CENTER, duration: 2);
            } else {
              ClaimModel claimModel = ClaimModel(
                username: username,
                idclaim: selectedPerson,
                amount: int.parse(amount.text),
                description: description.text,
              );
              add(claimModel);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Person {
  String name;
  int value;
  Person(this.name, this.value);
}
