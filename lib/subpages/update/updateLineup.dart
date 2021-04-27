import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class UpdateLineup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Update Lineup",
          style: TextStyle(
            color: AppColors.MAINTEXTBLACK,
            fontFamily: 'Poppins',
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
