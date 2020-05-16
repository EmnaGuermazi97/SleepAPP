import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/homePage.dart';
import 'package:tutorials_test/journalPage.dart';
import 'package:tutorials_test/profilePage.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'screens/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appLogo(String title, String img) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(img),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8adeef)),
            ),
          )
        ],
      ),
    ),
  );
}

Widget customButton(BuildContext context, String title, {String img}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
    width: MediaQuery.of(context).size.width * 0.8,
    height: 60,
    child: RaisedButton(
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue,
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
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        onPressed: () {}),
  );
}

Widget entryField(
  String title,
  TextEditingController myController, {
  bool isPassword = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2.0),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  controller: myController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      labelText: title,
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: false)),
            ),
          )
        ],
      ),
    ),
  );
}

Widget divider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
    ),
  );
}

Widget submitButton(BuildContext context, String title) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50.0,
    child: RaisedButton(
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blueGrey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/homePage');
        }),
  );
}

Widget customNavBar(BuildContext context, int activeIndex,
    {BaseAuth auth, VoidCallback logoutCallback, String userId}) {
  return CupertinoTabBar(
    backgroundColor: Theme.of(context).primaryColor,
    activeColor: Theme.of(context).accentColor,
    currentIndex: activeIndex,
    items: [
      BottomNavigationBarItem(
        icon: IconButton(
          icon: Icon(
            Icons.home,
            size: 40.0,
          ),
          onPressed: () {
            
            print('this is HomePage');
            print('this is userId  '+userId);
            Navigator.of(context).popUntil((route) => route.isFirst);
            //Navigator.push(context,MaterialPageRoute(builder: (context) =>HomePage(
            //    userId: userId, auth: auth, logoutCallback: logoutCallback 
            //    )
            //    ));
       
          },
        ),
      ),
      BottomNavigationBarItem(
        icon: IconButton(
          icon: Icon(
            Icons.assessment,
            size: 40.0,
          ),
          onPressed: () {
           print('this is JournalPage');
           print('this is userId  '+userId);
          //Navigator.pop(context);
            //Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.push(context,MaterialPageRoute(builder: (context) =>JournalPage(
                userId: userId, auth: auth, logoutCallback: logoutCallback 
                )
                ));
         
          },
        ),
      ),
      BottomNavigationBarItem(
        icon: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 40.0,
          ),
          onPressed: () {
            
         //print('this is ProfilePage');
         //print('this is userId  '+userId);
           // Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.push(context,MaterialPageRoute(builder: (context) =>ProfilePage(
                userId: userId, auth: auth, logoutCallback: logoutCallback 
                )
                ));
           /*new ProfilePage(
                userId: userId, auth: auth, logoutCallback: logoutCallback);
           // Navigator.pushReplacementNamed(context, '/profilePage');*/
          },
        ),
      ),
    ],
  );
}

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
        color: Colors.blue,
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

Widget articleStructure({String title, String paragraphe}) {
  return Padding(
      //this is the structure of a paragraph
      padding: const EdgeInsets.only(
          top: 10.0, right: 10.0, left: 10.0, bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.lightBlue[50],
            // has the effect of softening the shadow
            spreadRadius: 4.0, // has the effect of extending the shadow
          ),
        ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, right: 10.0, left: 10.0, bottom: 20.0),
              child: Text(
                paragraphe,
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
              ),
            ),
          ],
        ),
      ));
}

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

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.svgSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
