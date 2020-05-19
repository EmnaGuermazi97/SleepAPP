
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget navigationButton(BuildContext context, String title,
    {String img, String routeName}) {
      
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
    width: MediaQuery.of(context).size.width *
        0.9, //it was *0.8 i don't mind wat it is ,juste 7abit na7i el erreur for now
    height: MediaQuery.of(context).size.height / 12,
    child: RaisedButton(
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        
      //  color: Color(0xff476cfb),
        color: Color(0xff01579B),
       
       // color:Color.fromRGBO(143, 148, 251, 1),
       // color: Colors.blue,
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
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        }),
  );
}
