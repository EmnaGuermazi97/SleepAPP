import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';
import 'package:tutorials_test/widgets/navigationButton.dart';
import 'package:tutorials_test/widgets/navigationButtonISI.dart';
import 'services/authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback,this.user})
      : super(key: key){print("this is actual HomePage/n");
     print("this is user Id/n"+userId);}

  Utilisateur user;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  signOut() async {
    try {
      print("i am at homePageNavbar");
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
    Utilisateur userHome = new Utilisateur(widget.userId);
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
          centerTitle: true,
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        backgroundColor: Color(0xffeaf6ff),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 /* (navigationButton(context, 'Connect Watch',
                      img: 'assets/images/bluetooth.png')),*/
                  navigationButton(context, 'Learn More',
                      img: 'assets/images/learn.png',
                      routeName: '/learnMorePage'),
                  navigationButton(context, 'Help Me Sleep',
                      img: 'assets/images/help.png',
                      routeName: '/help_me_sleep'),
                  navigationButtonISI(context, 'Insomnia Sleep Index',
                      img: 'assets/images/isi.png', routeName: '/ISIPage',user: userHome),
                ]),
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
