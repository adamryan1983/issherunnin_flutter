import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ferry.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Legionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlandersInfo();
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Legionnaire's Status Updates",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    fontSize: 22))),
        Container(
          height: 40.0,
          color: AppColors.FIFTH_COLOR,
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
                    "Status",
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Reason",
                    style: TextStyle(fontSize: 15),
                  )),
              Container(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Note",
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
        IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FerryPage()),
              );
            }),
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
//

// Stream collectionStream =
//     FirebaseFirestore.instance.collection('legionnaire').snapshots();
// Stream documentStream = FirebaseFirestore.instance
//     .collection('legionnaire')
//     .doc('ABC123')
//     .snapshots();

class LegionnaireInfo extends StatelessWidget {
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
