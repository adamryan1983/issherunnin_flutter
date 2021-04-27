import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class UpdateLegionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Update Legionnaire",
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
