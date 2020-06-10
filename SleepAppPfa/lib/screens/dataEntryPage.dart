import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';
import 'package:tutorials_test/models/sleepDataCollection.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

class DataEntryPage extends StatefulWidget {
  DataEntryPage(
      {Key key, this.auth, this.userId, this.logoutCallback, this.user})
      : super(key: key) {
    print("this is actual DataEntryPage");
    print("this is user Id : " + userId);
  }

  Utilisateur user;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  //**************time input and functions section start
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay pickedSleep;
  TimeOfDay pickedWake;
  String pickedSleepFormatted = '';
  String pickedWakeFormatted = '';
  double _value = 6;

  final fb = FirebaseDatabase.instance;

  final sleepData = "sleepData";

  final today = DateTime.now();
  final yesterday = new DateFormat.Md().format(DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));

  addData(DatabaseReference ref, DailyData dd) async {
    DatabaseReference reference = ref.child(dd.date);

    reference.set(<String, dynamic>{
      "date": dd.date,
      "nbHours": dd.nbHours,
      "mood": dd.mood,
    }).then((_) {
      print('Data  committed.');
    });
  }

  getData(String userId) async {
    var db = FirebaseDatabase.instance
        .reference()
        .child("users")
        .child(userId)
        .child('sleepData');
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      print(values);
      print('values from database printed');
      widget.user.sleepDataMap=values;
      print(widget.user.getSleepData());
      print('values from UtilisateurClass printed');
    });

    print('Data Retrieved.');
  }

  Future<Null> selectTimeSleep(BuildContext context) async {
    pickedSleep = await showTimePicker(context: context, initialTime: _time);
    if (pickedSleep != null && pickedSleep != _time) {
      print('time selected : ${pickedSleep.format(context)}');
      print(pickedSleep);
      print(pickedSleep.hour);
    }
    setState(() {
      pickedSleepFormatted = pickedSleep.format(context);
    });
  }

  Future<Null> selectTimeWake(BuildContext context) async {
    pickedWake = await showTimePicker(context: context, initialTime: _time);
    if (pickedWake != null && pickedWake != _time) {
      print('time selected : ${pickedWake.format(context)}');
      print(pickedWake);
      print(pickedWake.hour);
    }
    setState(() {
      pickedWakeFormatted = pickedWake.format(context);
    });
  }

  String getDate(int hourSleep, int hourWake) {
    final date_0 = new DateFormat.Md().format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 1));
    final date_1 = new DateFormat.Md().format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (hourSleep > hourWake) {
      return (date_0);
    } else {
      return (date_1);
    }
  }

  int calculateSleepHours(int hourSleep, int hourWake) {
    if (hourSleep > hourWake) {
      return (24 - (hourSleep - hourWake) - 1);
    } else {
      return (hourWake - hourSleep - 1);
    }
  }

  String getMood(double value) {
    if (value < 3) {
      return ("Awful");
    } else if (value <= 5) {
      return ("Mediocre");
    } else if (value <= 8) {
      return ("Good");
    } else if (value >= 8) {
      return ("Very Good");
    }
  }

  int getMoodInt() {
    return (_value.round());
  }

  DailyData getDailyData(int hourSleep, int hourWake) {
    DailyData dailyData = new DailyData(getDate(hourSleep, hourWake),
        calculateSleepHours(pickedSleep.hour, pickedWake.hour), getMoodInt());
    return dailyData;
  }

  TestUser myUser = TestUser('karim');

  //**************time input and functions section end
  @override
  Widget build(BuildContext context) {
    final ref =
        fb.reference().child('users').child('2q0IKXUfgJPFysLx5mjGR79pta32');
    myUser.getName();
    myUser.setName('Nipsey Hussle');
    myUser.getSleepData();
    myUser.addToSleepData('02/06', DailyData('02/06', 8, 9));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //leading: Container(),
          title: Text('Data Entry'),
          centerTitle: true,
        ),
        backgroundColor: Colors.lightBlue[50], //it was blueGrey
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        color: Colors.blue,
                        onPressed: () {
                          print(_value);
                          setState(() {
                            selectTimeSleep(context);
                          });
                        },
                        child: Text('Time You Went To Sleep'),
                      ),
                      SizedBox(height: 50.0),
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            selectTimeWake(context);
                          });
                        },
                        child: Text('Time You Woke Up'),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          height: 40.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Text(
                            pickedSleepFormatted,
                            style: TextStyle(fontSize: 20.0),
                          )),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          height: 40.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Text(
                            pickedWakeFormatted,
                            style: TextStyle(fontSize: 20.0),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //mood section
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child:
                    Text('How Much Would You Rate Your Sleep From 0 to 10 ?'),
              ),
              Slider(
                value: _value,
                min: 0.0,
                max: 10.0,
                divisions: 10,
                activeColor: Colors.blue,
                inactiveColor: Colors.black,
                label: '$_value',
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CupertinoButton(
                    child: Text('Submit'),
                    color: Colors.lightGreen,
                    onPressed: () {
                      int hourSleep, hourWake;
                      hourSleep = pickedSleep.hour;
                      hourWake = pickedWake.hour;
                      print("****************");
                      DailyData dd = getDailyData(hourSleep, hourWake);
                      print(getMood(dd.mood.roundToDouble()));
                      myUser.addToSleepData(dd.date, dd);
                      print(dd.date);
                      print(dd.nbHours);
                      print(dd.mood);
                      addData(ref.child(sleepData), dd);
                      getData(widget.userId);
                      print("****************");
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: customNavBar(
          context,
          0,
          userId: widget.userId,
          auth: widget.auth,
          logoutCallback: widget.logoutCallback,
        ),
      ),
    );
  }
}
