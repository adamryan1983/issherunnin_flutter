import 'package:flutter/material.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateLegionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.MAINTEXTWHITE, //change your color here
        ),
        title: Image.asset('assets/images/ferrylogo-horizontal.png',
            fit: BoxFit.cover, width: 300),
        toolbarHeight: 100,
        backgroundColor: AppColors.PRIMARY_COLOR,
        centerTitle: true,
      ),
      body: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.7,
          child: BoatStatusWidget()
          // child: Text(
          //   "Update Flanders",
          //   style: TextStyle(
          //     color: AppColors.MAINTEXTBLACK,
          //     fontFamily: 'Poppins',
          //     fontSize: 22.0,
          //   ),
          // ),
          ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class BoatStatusWidget extends StatefulWidget {
  const BoatStatusWidget({Key key}) : super(key: key);

  @override
  _BoatUpdateStatus createState() => _BoatUpdateStatus();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BoatUpdateStatus extends State<BoatStatusWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _statuses = [
    'Running',
    'Tied up(Mechanical)',
    'Tied Up(Weather)',
    'Delayed'
  ]; // Option 2
  String _status, _reason, _note; // Option 2
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
            key: _formKey,
            child: Container(
              padding: new EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  header(),
                  _buildStatus(),
                  _buildReason(),
                  _buildNote(),
                  _buildSubmit(),
                  _buildBack()
                ],
              ),
            )));
  }

  Widget header() {
    return Container(
      child: Material(
          elevation: 5,
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Text("Update Legionnaire's Status",
                  style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w600)))),
    );
  }

  Widget _buildStatus() {
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Text('Boat Status')),
      Container(
          child: DropdownButton(
        hint: Text('Please select boat status'),
        value: _status,
        onChanged: (newValue) {
          setState(() {
            _status = newValue;
          });
        },
        items: _statuses.map((status) {
          return DropdownMenuItem(
            child: new Text(status),
            value: status,
          );
        }).toList(),
      )),
    ]);
  }

  Widget _buildReason() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter the reason(if known): ',
            ),
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the reason';
              }
              return null;
            },
            onChanged: (newValue) {
              setState(() {
                _reason = newValue;
              });
            }));
  }

  Widget _buildNote() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter any notes: ',
          ),
          validator: (String value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some notes';
            }
            return null;
          },
          onSaved: (String value) {
            // formData['email'] = value;
          },
        ));
  }

  Widget _buildSubmit() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (!_formKey.currentState.validate()) {
            AddBoatStatus(_status, _reason, _note);
          }
        },
        child: const Text('Submit'),
      ),
    );
  }

  Widget _buildBack() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.MAINTEXTWHITE),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.FOURTH_COLOR),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Back'),
      ),
    );
  }
}

class AddBoatStatus extends StatelessWidget {
  final String status;
  final String reason;
  final String note;

  AddBoatStatus(this.status, this.reason, this.note);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference boatStatus =
        FirebaseFirestore.instance.collection('legionnaire');

    Future<void> addBoatStatus() {
      // Call the user's CollectionReference to add a new user
      return boatStatus
          .add({'status': status, 'reason': reason, 'note': note})
          .then((value) => AlertDialog(
                title: Text('AlertDialog Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text('Status Updated')],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ))
          .catchError((error) => AlertDialog(
                title: Text('AlertDialog Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[Text('Error Updating!')],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }

    return TextButton(
      onPressed: addBoatStatus,
      child: Text(
        "Update Legionnaire",
      ),
    );
  }
}
