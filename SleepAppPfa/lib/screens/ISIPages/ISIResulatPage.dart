import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';

class ResultPage extends StatefulWidget {
  int isiResult;
  Utilisateur user;
  ResultPage({Key key, this.isiResult, this.user}) : super(key: key) {
    print('I am at ISI Resultat' + user.userID);
    
     user.isiResult=isiResult.toString(); 

  }
 
  
    
    
  @override
  _ResultPageState createState() => _ResultPageState(isiResult);
}

class _ResultPageState extends State<ResultPage> {
  int isiResult;
  _ResultPageState(this.isiResult);

  @override
  Widget build(BuildContext context) {
  
  

    
    print("this is saved user isiResult");
    print(widget.user.isiResult);

    FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(widget.user.userID)
        .update({
      'isiResult': widget.user.isiResult,
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ISI Result'),
          centerTitle: true,
          leading: Container(),
        ),
        //bottomNavigationBar: customNavBar(context, 0),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  'Score : $isiResult /28',
                  style: TextStyle(fontSize: 25.0),
                )),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                //color: Colors.blue,
                width: 1000,
                child: Padding(
                  padding: const EdgeInsets.all(05.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //ROW
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              width: 30.0,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('0-7 = No clinically significant insomnia',
                                style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                      //ROW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('8-14 = Subthreshold insomnia ',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 30.0, width: 30.0, color: Colors.orange),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('15-21 = Clinical insomnia (moderate)',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 30.0, width: 30.0, color: Colors.red),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('22-28 = Clinical insomnia (severe)',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              CupertinoButton(
                  child: Text('Go Home'),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  //color: Colors.blue
                  color: Color(0xff01579B),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
