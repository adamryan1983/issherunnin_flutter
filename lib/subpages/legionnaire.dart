import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Legionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> entries = <String>['Num1', 'Num2', 'Num3', 'Num4'];
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: screenWidth - 75,
            height: screenHeight * 0.70,
            child: Card(
              child: GridView.count(crossAxisCount: 4,
                  // Header
                  children: <Widget>[
                    Container(
                        height: 20,
                        color: AppColors.FIFTH_COLOR,
                        child: Center(
                          child: Text('Date/Time',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )),
                    Container(
                        height: 20,
                        color: AppColors.FIFTH_COLOR,
                        child: Center(
                          child: Text('Status',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )),
                    Container(
                        height: 20,
                        color: AppColors.FIFTH_COLOR,
                        child: Center(
                          child: Text('Reason',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )),
                    Container(
                        height: 20,
                        color: AppColors.FIFTH_COLOR,
                        child: Center(
                          child: Text('Notes',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        )),
                  ]),
            )),
      ],
    ));
  }
}



// ListView.builder(
//             itemCount: entries.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                   height: 10,
//                   color: AppColors.SECONDARY_COLOR,
//                   child: Center(child: Text('Entry $entries[index')));
//             })