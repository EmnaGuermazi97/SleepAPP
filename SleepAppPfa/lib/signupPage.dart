import 'package:flutter/material.dart';
import 'widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                appLogo('Sleep Better', 'assets/images/logo.png'),
                entryField('Username', usernameController),
                entryField('Email', emailController),
                entryField('Password', passwordController, isPassword: true),
                entryField('Confirm Password', confirmpasswordController,
                    isPassword: true),
                SizedBox(
                  height: 20.0,
                ),
                submitButton(context, 'signUp'),
                SizedBox(height: 30),
              ]),
        ),
      ),
    );
  }
}
