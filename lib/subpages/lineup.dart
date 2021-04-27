import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';

class LineupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/ferrylogo-horizontal.png',
                fit: BoxFit.cover, width: 300),
            toolbarHeight: 100,
            backgroundColor: AppColors.PRIMARY_COLOR,
          ),
          body: Center(
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
                              color: AppColors.THIRD_COLOR,
                              child: Center(
                                child: Text('Date/Time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              )),
                          Container(
                              height: 20,
                              color: AppColors.THIRD_COLOR,
                              child: Center(
                                child: Text('Status',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              )),
                          Container(
                              height: 20,
                              color: AppColors.THIRD_COLOR,
                              child: Center(
                                child: Text('Reason',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              )),
                          Container(
                              height: 20,
                              color: AppColors.THIRD_COLOR,
                              child: Center(
                                child: Text('Notes',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              )),
                        ]),
                  ))
            ],
          ))),
    );
  }
}

class LineupInfo extends StatefulWidget {
  @override
  LineupInfoState createState() => LineupInfoState();
}

class LineupInfoState extends State<LineupInfo> {
  Widget _buildlist() {
    return ListView(
      children: [
        Container(height: 10, child: Center(child: Text('1'))),
        Container(height: 10, child: Center(child: Text('2'))),
        Container(height: 10, child: Center(child: Text('3'))),
        Container(height: 10, child: Center(child: Text('4'))),
        Container(height: 10, child: Center(child: Text('5'))),
        Container(height: 10, child: Center(child: Text('6'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
