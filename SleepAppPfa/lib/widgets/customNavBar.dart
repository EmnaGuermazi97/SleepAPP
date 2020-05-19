import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/journalPage.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';
import 'package:tutorials_test/profilePage.dart';
import 'package:tutorials_test/services/authentication.dart';


Widget  customNavBar(BuildContext context, int activeIndex,
    {BaseAuth auth, VoidCallback logoutCallback, String userId}) {
      Utilisateur user = new Utilisateur(userId);
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
                userId: userId, auth: auth, logoutCallback: logoutCallback, user: user,
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
