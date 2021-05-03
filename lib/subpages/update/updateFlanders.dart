import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/boatController.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// ignore: must_be_immutable
class UpdateFlanders extends GetWidget<BoatController> {
  final TextEditingController note = TextEditingController();
  final TextEditingController reason = TextEditingController();
  String status;
  bool _selected = false;
  List<dynamic> items = [
    'Please select a status',
    'Running',
    'Delayed',
    'Tied Up(Mechanical)',
    'Tied Up(Weather)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.MAINTEXTWHITE, //change your color here
          ),
          title: Image.asset('assets/images/ferrylogo-horizontal.png',
              fit: BoxFit.cover, width: 300),
          toolbarHeight: 100,
          backgroundColor: AppColors.PRIMARY_COLOR,
          centerTitle: true,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Update Current Flanders Status",
                    style: (TextStyle(
                        fontSize: 22, color: AppColors.FOURTH_COLOR))),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                              child: Text('Boat Status')),
                          Obx(() => DropdownButton(
                                onChanged: (newValue) {
                                  controller.setSelected(newValue);
                                },
                                value: _selected
                                    ? controller.selected.value
                                    : controller.selected.value,
                                items: items.map((selectedType) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      selectedType,
                                    ),
                                    value: selectedType,
                                  );
                                }).toList(),
                              )),
                          TextField(
                            controller: reason,
                            decoration: InputDecoration(
                              labelText: "Enter reason (if known)",
                              hintText: "i.e. engine trouble",
                            ),
                            autofocus: true,
                          ),
                          TextField(
                            controller: note,
                            decoration: InputDecoration(
                              labelText: "Additional Notes",
                              hintText: "i.e. will be repaired in 2hrs",
                            ),
                            autofocus: true,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                            child: SignInButtonBuilder(
                              text: 'Update',
                              icon: Icons.add_comment_outlined,
                              onPressed: () {
                                controller.setFlandersStatus(
                                    controller.selected.value,
                                    reason.text,
                                    note.text);
                              },
                              backgroundColor: Colors.blueGrey[700],
                              width: 180.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.MAINTEXTWHITE),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.FOURTH_COLOR),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Back'),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ]));
  }
}
