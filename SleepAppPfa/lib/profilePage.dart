import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/homePage.dart';
import 'package:tutorials_test/loginSignUpPageEm.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.auth, this.userId, this.logoutCallback, this.user})
      : super(key: key); //{user.loadUserData(userId);}
  final Utilisateur user;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  /*void PUserName() {
    print("Hii " + createState().userNameValue);
  }*/

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool monVal = false;
  File _image;
  String userNameValue;
  String birthdayValue;
  String adressValue;
  String getUserNameValue() => userNameValue;
  signOut() async {
    try {
      print('we are at ProfilePageNavBar');
      print("this sign out");
      print(widget.userId);
      await widget.auth.signOut();
      print('this is after the sigout  function');
      widget.logoutCallback();
      print('this is after the logoutCallback function');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.user.loadUserData(widget.userId);
    TextEditingController controllerBirthday = TextEditingController();
    TextEditingController controllerUserName = TextEditingController();
    TextEditingController controllerLocation = TextEditingController();

    controllerBirthday.text = widget.user.birthDay;
    controllerUserName.text = widget.user.userName;
    controllerLocation.text = widget.user.location;
    print('this is email in profil Page' + widget.user.email);

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('ProfilePage'),
          centerTitle: true,
          actions: <Widget>[ RaisedButton(onPressed:

                {// hey can u try  the next line instead of navigator? it should work but i get an error ,even navigator gives me an error
                //they both give me the same error
                //FirebaseAuthProvider.instance.signOut();
                   Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginPageE(
                
               )
               )
               )}
               )
           /* new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)*/
          ],
        ),
        /* appBar: AppBar(
          leading: Container(),
          title: Text('Profile'),
          centerTitle: true,
        ),*/
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(
          child: Builder(
            builder: (context) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //to fix the user name we wrapped the row in a padding ,plus pen in a pudding and we removed main axis alignment
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        //color: Colors.pink,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text('Username',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Container(
                                width: 150,
                                child: new TextField(
                                    onChanged: (text) {
                                      widget.user.userName = text;
                                      print('the new temp value is  ' +
                                          widget.user.userName);
                                    },
                                    controller: controllerUserName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Color(0xff476cfb),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text('Birthday',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Container(
                                width: 150,
                                child: new TextField(
                                    decoration: InputDecoration(

                                        // hintText: "Add and Submit"
                                        ),
                                    controller: controllerBirthday,
                                    onChanged: (text) {
                                      birthdayValue = text;
                                      widget.user.birthDay = text;
                                      print('the new temp value is  ' +
                                          widget.user.birthDay);
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50.0,
                        ),
                        child: Container(
                          /*child: Checkbox(checkColor:Colors.blue,
                              value: monVal,materialTapTargetSize:MaterialTapTargetSize.padded,
                              onChanged: (bool value) {
                                print('birthay saved');
                                user.birthDay= controllerBirthday.text;
                                birthdayValue = controllerBirthday.text;
                                print('this is Utilisateur.birthday'+user.birthDay);
                                print('this is the birthday that has been saved'+birthdayValue);
                               // controllerBirthday.text = user.birthDay;
                                setState(() {
                                  monVal = value;
                                });
                              }
                              ),*/

                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Color(0xff476cfb),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text('Location',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Container(
                                width: 150,
                                child: new TextField(
                                    controller: controllerLocation,
                                    onChanged: (text) {
                                      widget.user.location = text;
                                      print('the new temp value is  ' +
                                          widget.user.location);
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Color(0xff476cfb),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('ISI Result',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18.0)),
                              SizedBox(width: 8.0),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(widget.user.isiResult,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Email',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 18.0)),
                                SizedBox(width: 8.0),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(widget.user.email,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Color(0xff476cfb),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      RaisedButton(
                        color: Color(0xff476cfb),
                        onPressed: () {
                          uploadPic(context);

                          FirebaseDatabase.instance
                              .reference()
                              .child('users')
                              .child(widget.user.userID)
                              .update({
                            'userName': widget.user.userName,
                            'birthDay': widget.user.birthDay,
                            'location': widget.user.location,
                            'Email': widget.user.email,
                          });
                        },
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: customNavBar(
          context,
          2,
          userId: widget.userId,
          auth: widget.auth,
          logoutCallback: widget.logoutCallback,
        ),
      ),
    );
  }
}
