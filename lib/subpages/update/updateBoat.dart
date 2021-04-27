import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:issherunnin_flutter/subpages/update/updateLegionnaire.dart';
import 'package:issherunnin_flutter/subpages/update/updateFlanders.dart';

const String title = 'Update Ferry';

class UpdateBoat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: screenWidth - 100,
            height: 120,
            child: Card(
                child: Center(
              child: Text("Legionnaire"),
            )),
          ),
        ),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              width: screenWidth - 100,
              height: 300,
              child: Card(
                  child: Center(
                      child: Column(
                children: [
                  Container(
                    child: Text(
                      "Flanders",
                      style: TextStyle(
                        color: AppColors.MAINTEXTBLACK,
                        fontFamily: 'Poppins',
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Flanders2",
                      style: TextStyle(
                        color: AppColors.MAINTEXTBLACK,
                        fontFamily: 'Poppins',
                        fontSize: 22.0,
                      ),
                    ),
                  )
                ],
              ))),
            ))
      ],
    ));
  }
}
