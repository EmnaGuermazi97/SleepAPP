import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Uitlisateur {
  String userID;
  String userName;
  String birthDay;
  String location;
  //Uitlisateur({this.userName,this.birthDay,this.location});
  Uitlisateur({userID, useName, birthday, location});
/*db = FirebaseDatabase.instance.reference().child("zoom_users");
db.once().then((DataSnapshot snapshot){
  Map<dynamic, dynamic> values = snapshot.value;
     values.forEach((key,values) {
      print(values["name"]);
    });
 });*/
  getUserData(String userID) async {
    var db =
        FirebaseDatabase.instance.reference().child('users').equalTo(userID);
    var snapshot = await db.once();
    var result = snapshot.value.values;
    userID = result["userID"];
    userName = result['userName'];
    birthDay = result["birthDay"];
    location = result['location'];
  }

  Map<String, dynamic> toJason() => {
        'UserID': userID,
        'userName': userName,
        'birthDay': birthDay,
        'location': location,
      };
}
