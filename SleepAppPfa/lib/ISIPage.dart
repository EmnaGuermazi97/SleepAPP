import 'package:flutter/material.dart';
import 'ISIResulatPage.dart';
import 'widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ISIPage extends StatefulWidget {
  
  @override
  _ISIPageState createState() => _ISIPageState();
  
}

class _ISIPageState extends State<ISIPage> {
  Future<void> _showMyDialog(String title) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('ERROR'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[Text(title)],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ]);
        });
  }

  bool checkIfAnswer(bool v1, bool v2, bool v3, bool v4, bool v5) {
    if (v1 || v2 || v3 || v4 || v5) {
      return true;
    } else
      return false;
  }

  bool checkIfOnlyAnswer(bool v1, bool v2, bool v3, bool v4, bool v5) {
    int positive = 0;
    int negative = 0;
    if (v1 == true) {
      positive++;
    } else {
      negative++;
    }
    if (v2 == true) {
      positive++;
    } else {
      negative++;
    }
    if (v3 == true) {
      positive++;
    } else {
      negative++;
    }
    if (v4 == true) {
      positive++;
    } else {
      negative++;
    }
    if (v5 == true) {
      positive++;
    } else {
      negative++;
    }
    if (positive > 1) {
      return false;
    } else {
      return true;
    }
  }

  CarouselController controllerButton = CarouselController();
  int _current = 0;
  int isiResult = 0;

  bool q1v1 = false;
  bool q1v2 = false;
  bool q1v3 = false;
  bool q1v4 = false;
  bool q1v5 = false;
  bool q2v1 = false;
  bool q2v2 = false;
  bool q2v3 = false;
  bool q2v4 = false;
  bool q2v5 = false;
  bool q3v1 = false;
  bool q3v2 = false;
  bool q3v3 = false;
  bool q3v4 = false;
  bool q3v5 = false;
  bool q4v1 = false;
  bool q4v2 = false;
  bool q4v3 = false;
  bool q4v4 = false;
  bool q4v5 = false;
  bool q5v1 = false;
  bool q5v2 = false;
  bool q5v3 = false;
  bool q5v4 = false;
  bool q5v5 = false;
  bool q6v1 = false;
  bool q6v2 = false;
  bool q6v3 = false;
  bool q6v4 = false;
  bool q6v5 = false;
  bool q7v1 = false;
  bool q7v2 = false;
  bool q7v3 = false;
  bool q7v4 = false;
  bool q7v5 = false;
  //Question question1= new Question(q1v1,q1v2,q1v3,q1v4,q1v5);
  List numberItems = [1, 2, 3, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //leading: Container(),
          title: Text('Insomnia Sleep Index'),
          centerTitle: true,
        ),
        backgroundColor: Colors.lightBlue[50],//it was blueGrey
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CarouselSlider(
                carouselController: controllerButton,
                items: [
                  carouselItem(context, customQuestion1()),
                  carouselItem(context, customQuestion2()),
                  carouselItem(context, customQuestion3()),
                  carouselItem(context, customQuestion4()),
                  carouselItem(context, customQuestion5()),
                  carouselItem(context, customQuestion6()),
                  carouselItem(context, customQuestion7()),
                ],
                options: CarouselOptions(
                    height: 410.0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: numberItems.map((url) {
                  int index = numberItems.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => controllerButton.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  RaisedButton(
                    onPressed: () => controllerButton.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  //Question
                  if (q1v1) {
                    isiResult += 0;
                  }
                  if (q1v2) {
                    isiResult += 1;
                  }
                  if (q1v3) {
                    isiResult += 2;
                  }
                  if (q1v4) {
                    isiResult += 3;
                  }
                  if (q1v5) {
                    isiResult += 4;
                  }
                  //Question
                  if (q2v1) {
                    isiResult += 0;
                  }
                  if (q2v2) {
                    isiResult += 1;
                  }
                  if (q2v3) {
                    isiResult += 2;
                  }
                  if (q2v4) {
                    isiResult += 3;
                  }
                  if (q2v5) {
                    isiResult += 4;
                  }
                  //Question
                  if (q3v1) {
                    isiResult += 0;
                  }
                  if (q3v2) {
                    isiResult += 1;
                  }
                  if (q3v3) {
                    isiResult += 2;
                  }
                  if (q3v4) {
                    isiResult += 3;
                  }
                  if (q3v5) {
                    isiResult += 4;
                  }
                  //Question
                  if (q4v1) {
                    isiResult += 0;
                  }
                  if (q4v2) {
                    isiResult += 1;
                  }
                  if (q4v3) {
                    isiResult += 2;
                  }
                  if (q4v4) {
                    isiResult += 3;
                  }
                  if (q4v5) {
                    isiResult += 4;
                  }
                  //Question
                  if (q5v1) {
                    isiResult += 0;
                  }
                  if (q5v2) {
                    isiResult += 1;
                  }
                  if (q5v3) {
                    isiResult += 2;
                  }
                  if (q5v4) {
                    isiResult += 3;
                  }
                  if (q5v5) {
                    isiResult += 4;
                  }
                  //Question
                  if (q6v1) {
                    isiResult += 0;
                  }
                  if (q6v2) {
                    isiResult += 1;
                  }
                  if (q6v3) {
                    isiResult += 2;
                  }
                  if (q6v4) {
                    isiResult += 3;
                  }
                  if (q6v5) {
                    isiResult += 4;
                  }
                  //Question
                  if (q7v1) {
                    isiResult += 0;
                  }
                  if (q7v2) {
                    isiResult += 1;
                  }
                  if (q7v3) {
                    isiResult += 2;
                  }
                  if (q7v4) {
                    isiResult += 3;
                  }
                  if (q7v5) {
                    isiResult += 4;
                  }
                  print(isiResult);
                  if (checkIfAnswer(q1v1, q1v2, q1v3, q1v4, q1v5) &&
                      checkIfAnswer(q2v1, q2v2, q2v3, q2v4, q2v5) &&
                      checkIfAnswer(q3v1, q3v2, q3v3, q3v4, q3v5) &&
                      checkIfAnswer(q4v1, q4v2, q4v3, q4v4, q4v5) &&
                      checkIfAnswer(q5v1, q5v2, q5v3, q5v4, q5v5) &&
                      checkIfAnswer(q6v1, q6v2, q6v3, q6v4, q6v5) &&
                      checkIfAnswer(q7v1, q7v2, q7v3, q7v4, q7v5)) {
                    if (checkIfOnlyAnswer(q1v1, q1v2, q1v3, q1v4, q1v5) &&
                        checkIfOnlyAnswer(q2v1, q2v2, q2v3, q2v4, q2v5) &&
                        checkIfOnlyAnswer(q3v1, q3v2, q3v3, q3v4, q3v5) &&
                        checkIfOnlyAnswer(q4v1, q4v2, q4v3, q4v4, q4v5) &&
                        checkIfOnlyAnswer(q5v1, q5v2, q5v3, q5v4, q5v5) &&
                        checkIfOnlyAnswer(q6v1, q6v2, q6v3, q6v4, q6v5) &&
                        checkIfOnlyAnswer(q7v1, q7v2, q7v3, q7v4, q7v5)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  isiResult: isiResult,
                                )),
                      );
                    } else {
                      print('please one answer per question');
                      _showMyDialog('please one answer per question');
                      isiResult=0;
                    }
                  } else {
                    print('please answer all questions');
                    _showMyDialog('please answer all questions');
                    isiResult=0;
                  }
                },
                color: Colors.lightGreen,
                child: Text('Submit'),
              )
            ],
          ),
        ),
        //bottomNavigationBar: customNavBar(context, 0),
      ),
    );
  }

  Widget customQuestion1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Q1:Difficulty falling asleep ?',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        CheckboxListTile(
          title: const Text('None'),
          activeColor: Colors.black,
          value: q1v1,
          onChanged: (bool value) {
            setState(() {
              q1v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Mild'),
          activeColor: Colors.black,
          value: q1v2,
          onChanged: (bool value) {
            setState(() {
              q1v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Moderate'),
          activeColor: Colors.black,
          value: q1v3,
          onChanged: (bool value) {
            setState(() {
              q1v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Severe'),
          activeColor: Colors.black,
          value: q1v4,
          onChanged: (bool value) {
            setState(() {
              q1v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Severe'),
          activeColor: Colors.black,
          value: q1v5,
          onChanged: (bool value) {
            setState(() {
              q1v5 = value;
            });
          },
        ),
      ],
    );
  }

  Widget customQuestion2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Q2:Difficulty staying asleep ?',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        CheckboxListTile(
          title: const Text('None'),
          activeColor: Colors.black,
          value: q2v1,
          onChanged: (bool value) {
            setState(() {
              q2v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Mild'),
          activeColor: Colors.black,
          value: q2v2,
          onChanged: (bool value) {
            setState(() {
              q2v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Moderate'),
          activeColor: Colors.black,
          value: q2v3,
          onChanged: (bool value) {
            setState(() {
              q2v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Severe'),
          activeColor: Colors.black,
          value: q2v4,
          onChanged: (bool value) {
            setState(() {
              q2v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Severe'),
          activeColor: Colors.black,
          value: q2v5,
          onChanged: (bool value) {
            setState(() {
              q2v5 = value;
            });
          },
        ),
      ],
    );
  }

  Widget customQuestion3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Q3:Problems waking up too early ?',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        CheckboxListTile(
          title: const Text('None'),
          activeColor: Colors.black,
          value: q3v1,
          onChanged: (bool value) {
            setState(() {
              q3v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Mild'),
          activeColor: Colors.black,
          value: q3v2,
          onChanged: (bool value) {
            setState(() {
              q3v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Moderate'),
          activeColor: Colors.black,
          value: q3v3,
          onChanged: (bool value) {
            setState(() {
              q3v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Severe'),
          activeColor: Colors.black,
          value: q3v4,
          onChanged: (bool value) {
            setState(() {
              q3v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Severe'),
          activeColor: Colors.black,
          value: q3v5,
          onChanged: (bool value) {
            setState(() {
              q3v5 = value;
            });
          },
        ),
      ],
    );
  }

  Widget customQuestion4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Q4:How SATISFIED/DISSATISFIED are you with your CURRENT sleep pattern?',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        CheckboxListTile(
          title: const Text('Very Satisfied'),
          activeColor: Colors.black,
          value: q4v1,
          onChanged: (bool value) {
            setState(() {
              q4v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Satisfied'),
          activeColor: Colors.black,
          value: q4v2,
          onChanged: (bool value) {
            setState(() {
              q4v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Moderately Satisfied'),
          activeColor: Colors.black,
          value: q4v3,
          onChanged: (bool value) {
            setState(() {
              q4v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Dissatisfied'),
          activeColor: Colors.black,
          value: q4v4,
          onChanged: (bool value) {
            setState(() {
              q4v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Dissatisfied'),
          activeColor: Colors.black,
          value: q4v5,
          onChanged: (bool value) {
            setState(() {
              q4v5 = value;
            });
          },
        ),
      ],
    );
  }

  Widget customQuestion5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Q5:How NOTICEABLE to others do you think your sleep problem is in terms of impairing the quality of your life? ',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        CheckboxListTile(
          title: const Text('Not At All Noticeable'),
          activeColor: Colors.black,
          value: q5v1,
          onChanged: (bool value) {
            setState(() {
              q5v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('A Little'),
          activeColor: Colors.black,
          value: q5v2,
          onChanged: (bool value) {
            setState(() {
              q5v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Somewhat'),
          activeColor: Colors.black,
          value: q5v3,
          onChanged: (bool value) {
            setState(() {
              q5v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Much'),
          activeColor: Colors.black,
          value: q5v4,
          onChanged: (bool value) {
            setState(() {
              q5v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Much Noticeable'),
          activeColor: Colors.black,
          value: q5v5,
          onChanged: (bool value) {
            setState(() {
              q5v5 = value;
            });
          },
        ),
      ],
    );
  }

  Widget customQuestion6() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Q6:How WORRIED/DISTRESSED are you about your current sleep problem?  ',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
        CheckboxListTile(
          title: const Text('Not At All Worried'),
          activeColor: Colors.black,
          value: q6v1,
          onChanged: (bool value) {
            setState(() {
              q6v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('A Little'),
          activeColor: Colors.black,
          value: q6v2,
          onChanged: (bool value) {
            setState(() {
              q6v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Somewhat'),
          activeColor: Colors.black,
          value: q6v3,
          onChanged: (bool value) {
            setState(() {
              q6v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Much'),
          activeColor: Colors.black,
          value: q6v4,
          onChanged: (bool value) {
            setState(() {
              q6v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Much Worried'),
          activeColor: Colors.black,
          value: q6v5,
          onChanged: (bool value) {
            setState(() {
              q6v5 = value;
            });
          },
        ),
      ],
    );
  }

  Widget customQuestion7() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Q7:To what extent do you consider your sleep problem to INTERFERE with your daily functioning (e.g.concentration, memory, mood, etc.) CURRENTLY?  ',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
        CheckboxListTile(
          title: const Text('Not At All Interfering'),
          activeColor: Colors.black,
          value: q7v1,
          onChanged: (bool value) {
            setState(() {
              q7v1 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('A Little'),
          activeColor: Colors.black,
          value: q7v2,
          onChanged: (bool value) {
            setState(() {
              q7v2 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Somewhat'),
          activeColor: Colors.black,
          value: q7v3,
          onChanged: (bool value) {
            setState(() {
              q7v3 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Much'),
          activeColor: Colors.black,
          value: q7v4,
          onChanged: (bool value) {
            setState(() {
              q7v4 = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Very Much Interfering'),
          activeColor: Colors.black,
          value: q7v5,
          onChanged: (bool value) {
            setState(() {
              q7v5 = value;
            });
          },
        ),
      ],
    );
  }
}
