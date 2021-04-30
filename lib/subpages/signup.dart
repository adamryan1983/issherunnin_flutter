import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:issherunnin_flutter/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:issherunnin_flutter/controllers/authController.dart';

class Signup extends GetWidget<AuthController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstn = TextEditingController();
  final TextEditingController lastn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _showButtonPressDialog(BuildContext context, String provider) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('$provider Button Pressed!'),
        backgroundColor: Colors.black26,
        duration: Duration(milliseconds: 400),
      ));
    }

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
                    child: Text("Sign Up", style: (TextStyle(fontSize: 22))),
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
                              hintText: "example@mail.com",
                            ),
                            autofocus: true,
                          ),
                          TextField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: "Password",
                            ),
                            autofocus: true,
                            obscureText: true,
                          ),
                          Container(
                            width: 10,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: AlignmentDirectional.center,
                            child: SignInButtonBuilder(
                              text: 'Sign Up',
                              icon: Icons.email,
                              onPressed: () {
                                _showButtonPressDialog(context, 'Email');
                              },
                              backgroundColor: Colors.blueGrey[700],
                              width: 180.0,
                            ),
                          ),
                          Container(
                            width: 20,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: AlignmentDirectional.center,
                            child: SignInButtonBuilder(
                              text: 'Back',
                              icon: Icons.arrow_back_outlined,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              backgroundColor: Colors.red[700],
                              width: 100.0,
                            ),
                          )
                        ],
                      ))
                ])));
  }
}
