import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class Verification extends StatelessWidget {
  const Verification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/ferrylogo-horizontal.png',
              fit: BoxFit.cover, width: 300),
          toolbarHeight: 100,
          backgroundColor: AppColors.PRIMARY_COLOR,
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Thank you for your submission.",
                style: TextStyle(
                  color: AppColors.MAINTEXTBLACK,
                  fontFamily: 'Montserrat',
                  fontSize: 22.0,
                ),
              ),
            ),
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
