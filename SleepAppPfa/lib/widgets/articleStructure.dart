import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget articleStructure({String title, String paragraphe}) {
  return Padding(
      //this is the structure of a paragraph
      padding: const EdgeInsets.only(
          top: 10.0, right: 10.0, left: 10.0, bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
           // color: Colors.lightBlue[50],
           color:Color.fromRGBO(143, 148, 251, 1),
            // has the effect of softening the shadow
            spreadRadius: 4.0, // has the effect of extending the shadow
          ),
        ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, right: 10.0, left: 10.0, bottom: 20.0),
              child: Text(
                paragraphe,
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
              ),
            ),
          ],
        ),
      ));
}