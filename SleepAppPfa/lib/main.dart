import 'package:flutter/material.dart';
import 'package:tutorials_test/screens/ISIPages/ISIPage.dart';
import 'package:tutorials_test/screens/helpMeSleepPages/help_me_sleep.dart';

import 'package:tutorials_test/screens/learnMorePages/LearnMorePageFront.dart';

import 'Authentication/ActionDetection.dart';







import 'loginSignUpPageEm.dart';

import 'services/authentication.dart';

import 'homePage.dart';



import 'journalPage.dart';

import 'profilePage.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Sleep App',
        theme: ThemeData(
          primaryColor: Color(0xff1a4b6f),
          accentColor: Colors.white,
        ),
        home: 
        //new LoginPageFb(),
        new RootPage(auth: new Auth()),
        routes: {
          '/homePage': (context) => HomePage(),
          '/journalPage': (context) => JournalPage(),
          '/profilePage': (context) => ProfilePage(),
          '/learnMorePage' : (context) => LearnMorePageFront(),
          '/loginPageE' : (context) => LoginPageE(),
          '/ISIPage': (context) => ISIPage(),
          '/help_me_sleep': (context) => HelpMeSleepPage(),
        });
  }
}

