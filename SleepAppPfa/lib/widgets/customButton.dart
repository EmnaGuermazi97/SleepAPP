
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton(BuildContext context, String title, {String img}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
    width: MediaQuery.of(context).size.width * 0.8,
    height: 60,
    child: RaisedButton(
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(img),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        onPressed: () {}),
  );
}