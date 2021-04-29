import 'package:flutter/material.dart';
import 'tabs.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Is She Runnin'?",
      theme: ThemeData(
          fontFamily: 'Montserrat',
          backgroundColor: AppColors.PRIMARY_COLOR,
          primaryColor: AppColors.PRIMARY_COLOR,
          primaryColorLight: AppColors.MAINTEXTBLACK,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppColors.MAINBGWHITE),
      home: TabsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
