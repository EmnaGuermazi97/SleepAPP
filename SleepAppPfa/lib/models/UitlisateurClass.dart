import 'package:firebase_database/firebase_database.dart';
import 'package:tutorials_test/models/sleepDataCollection.dart';

class Utilisateur {
  String userID;
  String userName;
  String birthDay;
  String location;
  String email;
  String isiResult;
  String profilePicName;
  Map<dynamic, dynamic> sleepDataMap;
  Utilisateur(String userid) {
    this.userID = userid;
    var db = FirebaseDatabase.instance.reference().child("users");
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (values['UserID'] == this.userID) {
          this.userName = values['userName'];
          this.birthDay = values['birthDay'];
          this.location = values['location'];
          this.email = values['Email'];
          this.isiResult = values['isiResult'];
          this.profilePicName = values['profilePicName'];

          print(this.email);
        }
      });
    });
    var dbvalues = FirebaseDatabase.instance
        .reference()
        .child("users")
        .child(userID)
        .child('sleepData');
    dbvalues.once().then((DataSnapshot snapshot) {
      sleepDataMap = snapshot.value;
    });
  }

  getSleepData() {
    return (this.sleepDataMap);
  }

  loadUserData(String userid) async {
    this.userID = userid;
    var db = FirebaseDatabase.instance.reference().child("users");
    await db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (values['UserID'] == this.userID) {
          this.userName = values['userName'];
          this.birthDay = values['birthDay'];
          this.location = values['location'];
          this.email = values['Email'];
        }
      });
    });
  }

  Map<String, dynamic> toJason() => {
        'UserID': userID,
        'userName': userName,
        'birthDay': birthDay,
        'location': location,
      };
}
