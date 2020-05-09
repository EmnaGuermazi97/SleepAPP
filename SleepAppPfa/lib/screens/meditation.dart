import 'package:flutter/material.dart';

class Meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: size.height * .45,
        decoration: BoxDecoration(
          color: Colors.orange[100],
          image: DecorationImage(
            image: AssetImage("assets/images/relaxation-png-1.png"),
          ),
        ),
      ),
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 210, horizontal: 30),
        child: Container(
          height: size.height * .70,
          child: Text(
            "How to do meditate ?",
            style: Theme.of(context).textTheme.display1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 30,
                ),
          ),
        ),
      ),
      ),
    ]));
  }
}
