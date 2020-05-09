import 'package:flutter/material.dart';
import 'widgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Profile'),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(),
        bottomNavigationBar: customNavBar(context, 2),
      ),
    );
  }
}
