import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Declarations
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: appLogo('Sleep Better', 'assets/images/logo.png'),
              ),
              entryField('Email', emailController),
              entryField('Password', passwordController, isPassword: true),
              SizedBox(
                height: 20.0,
              ),
              submitButton(context, 'LogIn'),
              divider(),
              customButton(context,'Continue with Google',
                  img: 'assets/images/google.png'),
              SizedBox(
                height: 30.0,
              ),
              customButton(context,'Continue With FaceBook',
                  img: 'assets/images/facebook.png'),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Don't have an account ?",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, '/signupPage');
                  Navigator.of(context).popUntil((route) => route.isFirst); // 내 사랑 Changed this !
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
