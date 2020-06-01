import 'package:flutter/material.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

class JournalPage extends StatefulWidget {
  JournalPage({Key key, this.userId, this.user})
      : super(key: key) {
    print("this is actual journalPage/n");
     print("this is user Id/n"+userId);
    // prints "Print me to console"}
  }
  Utilisateur user;

  final String userId;
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: new AppBar(
          title: new Text('JournalPage'),
          centerTitle: true,
          /*actions: <Widget>[

          ],*/
        ),
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(),
        bottomNavigationBar: customNavBar(
          context,
          1,
          userId: widget.userId,
        
        ),
      ),
    );
  }
}