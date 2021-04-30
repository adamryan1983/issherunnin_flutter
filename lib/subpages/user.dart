import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';
import 'package:issherunnin_flutter/subpages/signup.dart';

//ignore: must_be_immutable
class UserPage extends GetWidget<AuthController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  String emailtemp, passwordtemp;

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => UserPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/ferrylogo-horizontal.png',
              fit: BoxFit.cover, width: 300),
          toolbarHeight: 100,
          backgroundColor: AppColors.PRIMARY_COLOR,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Log In Existing User",
                  style: (TextStyle(fontSize: 22))),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "Email",
                        // controller: passwordController,
                        hintText: "example@mail.com",
                      ),
                      autofocus: true,
                      onChanged: (String text) {
                        emailtemp = text;
                      },
                    ),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      autofocus: true,
                      obscureText: true,
                      onChanged: (String text) {
                        passwordtemp = text;
                      },
                    ),
                    Container(
                      width: 10,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: AlignmentDirectional.center,
                      child: SignInButtonBuilder(
                        text: 'Sign In',
                        icon: Icons.email,
                        onPressed: () {
                          print("Pressed");
                          print(email.text);
                          print(pass.text);
                          controller.login(email.text, pass.text);
                        },
                        backgroundColor: Colors.blueGrey[700],
                        width: 220.0,
                      ),
                    )
                  ],
                )),
            // GestureDetector(
            //   // When the child is tapped, show a snackbar.
            //   onTap: () {
            //     final snackBar = SnackBar(content: Text("Tap"));
            //     controller.login(email.text, pass.text);
            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //   },
            //   // The custom button
            //   child: Container(
            //     padding: EdgeInsets.all(12.0),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).buttonColor,
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: Text('My Button'),
            //   ),
            // ),
            Container(
                padding: EdgeInsets.fromLTRB(50, 10.0, 50.0, 0),
                child: Text("Or",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18))),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: Container(
                    child: ElevatedButton(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: AppColors.MAINTEXTWHITE,
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[700],
                        )))),
            Divider(),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () {},
            ),
            Divider(),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () {},
            ),
            Divider(),
            SignInButton(
              Buttons.Apple,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    controller.login(email.text, pass.text);
  }
}

// ignore: must_be_immutable
// class UserPage extends GetWidget<AuthController> {
//   TextEditingController email = TextEditingController(text: 'email');
//   TextEditingController pass = TextEditingController(text: 'password');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//             child: TextField(
//               controller: pass,
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 hintStyle: TextStyle(color: Colors.black),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(10.0),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: new BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.blue[400])),
//                 isDense: true, // Added this
//                 contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//               ),
//               cursorColor: Colors.black,
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//           GestureDetector(
//               onTap: () {
//                 print("Login Clicked Event");
//                 _login();
//               },
//               child: Text("Login"))
//         ],
//       ),
//     ));
//   }

