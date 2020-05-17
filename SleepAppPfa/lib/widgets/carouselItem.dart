import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget carouselItem(BuildContext context, Widget question) {
  return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Center(
        child: question,
      ));
}
