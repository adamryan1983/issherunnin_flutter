import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class LineupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/ferrylogo-horizontal.png',
              fit: BoxFit.cover, width: 300),
          toolbarHeight: 100,
          backgroundColor: AppColors.PRIMARY_COLOR,
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                child: Text("Lineup Updates",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 22))),
            Container(
              height: 40.0,
              color: AppColors.THIRD_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Date/Time",
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Cars",
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Location",
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Side",
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "Name $index",
                            style: TextStyle(fontSize: 12),
                          )),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Age $index",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Age $index",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Age $index",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        )));
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
//

// Stream collectionStream =
//     FirebaseFirestore.instance.collection('legionnaire').snapshots();
// Stream documentStream = FirebaseFirestore.instance
//     .collection('legionnaire')
//     .doc('ABC123')
//     .snapshots();

class LineupInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference legionnaireUpdate =
        FirebaseFirestore.instance.collection('legionnaire');

    return StreamBuilder<QuerySnapshot>(
      stream: legionnaireUpdate.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            print(document["status"]);
            return new ListTile(
              title: new Text(document.data()['status']),
              subtitle: new Text(document.data()['datetime']),
            );
          }).toList(),
        );
      },
    );
  }
}
