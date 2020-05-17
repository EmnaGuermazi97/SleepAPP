import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Utilisateur {
  String userID;
  String userName;
  String birthDay;
  String location;
  String email;
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
          print(this.email);
        }
      });
    });
  }
/*db = FirebaseDatabase.instance.reference().child("zoom_users");
db.once().then((DataSnapshot snapshot){
  Map<dynamic, dynamic> values = snapshot.value;
     values.forEach((key,values) {
      print(values["name"]);
    });
 });*/
  /*
  Utilisateur loadUserData(userid) {
    Utilisateur user = new Utilisateur(userid);
    var db = FirebaseDatabase.instance.reference().child("users");
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        user.userID = values['UserID'];
        user.userName = values['userName'];
        user.birthDay = values['birthDay'];
        user.location = values['location'];
        print(user.birthDay);
      });
    });
    return user;
  }
*/
  Map<String, dynamic> toJason() => {
        'UserID': userID,
        'userName': userName,
        'birthDay': birthDay,
        'location': location,
      };
}
