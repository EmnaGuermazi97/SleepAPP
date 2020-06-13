import 'package:flutter/material.dart';
import 'package:tutorials_test/screens/how_did_you_sleep/dataEntryPage.dart';


class DailyData {
  String date;
  int nbHours;
  int mood;

  DailyData(this.date, this.nbHours, this.mood);

  Map<String, Object> toMap() {
    Map<String, Object> result = new Map<String, Object>();
    result['date'] = date;
    result['nbHours'] = nbHours;
    result['mood'] = mood;

    return result;
  }
}

// Map<String, DailyData> sleepDataMap;

// Map<String, DailyData> sleepDataMapped = {
//   '01/05': DailyData('01/05', 8, 5),
//   '02/05': DailyData('02/05', 7, 6),
//   '03/05': DailyData('03/05', 7, 10),
//   '04/05': DailyData('04/05', 6, 9),
//   '05/05': DailyData('05/05', 9, 8),
//   '06/05': DailyData('06/05', 5, 7),
//   '07/05': DailyData('07/05', 9, 4),
// };

List<DailyData> sleepData = [
  DailyData('01/05', 8, 5),
  DailyData('02/05', 7, 6),
  DailyData('03/05', 7, 10),
  DailyData('04/05', 6, 9),
  DailyData('05/05', 9, 8),
  DailyData('06/05', 5, 7),
  DailyData('07/05', 9, 4),
  DailyData('08/05', 8, 5),
  DailyData('09/05', 7, 6),
  DailyData('10/05', 7, 10),
  DailyData('11/05', 6, 9),
  DailyData('12/05', 9, 8),
  DailyData('13/05', 5, 7),
  DailyData('14/05', 9, 4),
  DailyData('15/05', 12, 8),
];

class MoodData {
  String mood;
  double percentage;
  Color color;
  MoodData(this.mood, this.percentage, this.color);
}

List<MoodData> moodData = [
  MoodData('Very Good', 52, Color.fromRGBO(255, 189, 57, 1)),
  MoodData('Good', 25, Color.fromRGBO(9, 0, 136, 1)),
  MoodData('Mediocre', 38, Color.fromRGBO(147, 0, 119, 1)),
  MoodData('Awful', 34, Color.fromRGBO(228, 0, 124, 1)),
];

class TestUser {
  String name;
  final Map<String, DailyData> sleepDataMap = {};

  TestUser(
    this.name,
  );

  void setName(String name) {
    this.name = name;
    print("new name = " + name);
  }

  String getName() {
    print("current name = " + name);
    return (this.name);
  }

  void addToSleepData(String key, DailyData value) {
    sleepDataMap[key] = value;
    print(sleepDataMap);
  }

  Map<String, DailyData> getSleepData() {
    print(sleepDataMap);
    return (this.sleepDataMap);
  }
}
