import 'package:flutter/material.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'widgets.dart';

class JournalPage extends StatefulWidget {
  JournalPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key) {
    print("this is actual journalPage/n");
     print("this is user Id/n"+userId);
    // prints "Print me to console"}
  }
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: new AppBar(
          title: new Text('JournalPage'),
          centerTitle: true,
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                //onPressed: signOut
                )    
          ],
        ),
       /* appBar: AppBar(
          leading: Container(),
          title: Text('Journal'),
          centerTitle: true,
        ),*/
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(),
        bottomNavigationBar: customNavBar(
          context,
          1,
          userId: widget.userId,
          auth: widget.auth,
          logoutCallback: widget.logoutCallback,
        ),
      ),
    );
  }
}

void main() {}
