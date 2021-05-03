import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/lineupController.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// ignore: must_be_immutable
class UpdateLineup extends GetWidget<LineupController> {
  final TextEditingController cars = TextEditingController();
  final TextEditingController location = TextEditingController();
  String status;
  bool _selected = false;
  List<dynamic> items = [
    'Please select a side',
    'Bell Island',
    'Portugal Cove-St. Philips'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("Update Current Lineup Conditions",
                style:
                    (TextStyle(fontSize: 22, color: AppColors.FOURTH_COLOR))),
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
                          child: Text('Select which side:')),
                      Obx(() => DropdownButton(
                            onChanged: (newValue) {
                              controller.setSelectedSide(newValue);
                            },
                            value: _selected
                                ? controller.selectedSide.value
                                : controller.selectedSide.value,
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
                        controller: cars,
                        decoration: InputDecoration(
                          labelText: "Enter number of vehicles",
                          hintText: "i.e. 25",
                        ),
                        autofocus: true,
                      ),
                      TextField(
                        controller: location,
                        decoration: InputDecoration(
                          labelText: "Approx. Location",
                          hintText: "i.e. Up to ticket booth",
                        ),
                        autofocus: true,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                        child: SignInButtonBuilder(
                          text: 'Update',
                          icon: Icons.add_comment_outlined,
                          onPressed: () {
                            controller.setLineupStatus(cars.text,
                                controller.selectedSide.value, location.text);
                          },
                          backgroundColor: Colors.blueGrey[700],
                          width: 180.0,
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ]);
  }
}
