import 'package:flutter/material.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'widgets.dart';

class ProfilePage extends StatefulWidget {
    ProfilePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return SafeArea(
      child: Scaffold(
         appBar: new AppBar(
          title: new Text('ProfilePage'),
          centerTitle: true,
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
       /* appBar: AppBar(
          leading: Container(),
          title: Text('Profile'),
          centerTitle: true,
        ),*/
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(),
        bottomNavigationBar: customNavBar(context, 2,
          userId: widget.userId,
          auth: widget.auth,
          logoutCallback: widget.logoutCallback,),
      ),
    );
  }
}
