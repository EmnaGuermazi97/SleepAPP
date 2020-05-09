import 'package:flutter/material.dart';
import 'widgets.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Journal'),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(),
        bottomNavigationBar: customNavBar(context, 1),
      ),
    );
      
    
  }
}