import 'package:flutter/material.dart';
import 'Authentication/ActionDetection.dart';
import 'ISIPage.dart';
import 'LearnMorePageFront.dart';
import 'help_me_sleep.dart';

import 'screens/LearnMoreActualPage.dart';

import 'loginSignUpPageEm.dart';
import 'mainFacebook.dart';
import 'services/authentication.dart';
import 'widgets.dart';
import 'models/learnMoreArticlesClasses.dart';
import 'homePage.dart';



import 'journalPage.dart';

import 'profilePage.dart';
import 'signupPage.dart';



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
          '/signupPage' : (context) => SignUpPage(),
          '/learnMorePage' : (context) => LearnMorePage(),
          '/loginPageE' : (context) => LoginPageE(),
          '/ISIPage': (context) => ISIPage(),
          '/help_me_sleep': (context) => HelpMeSleepPage(),
        });
  }
}

