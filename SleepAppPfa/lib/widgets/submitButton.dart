import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget submitButton(BuildContext context, String title) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50.0,
    child: RaisedButton(
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blueGrey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/homePage');
        }),
  );
}
