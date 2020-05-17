import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget entryField(
  String title,
  TextEditingController myController, {
  bool isPassword = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2.0),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  controller: myController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      labelText: title,
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: false)),
            ),
          )
        ],
      ),
    ),
  );
}
