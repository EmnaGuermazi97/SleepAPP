import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tutorials_test/models/UitlisateurClass.dart';
import 'package:tutorials_test/models/sleepDataCollection.dart';
import 'package:tutorials_test/services/authentication.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/*
class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

final List<ChartData> chartData = [
  ChartData('Very Good', 52, Color.fromRGBO(255, 189, 57, 1)),
  ChartData('Good', 25, Color.fromRGBO(9, 0, 136, 1)),
  ChartData('Mediocre', 38, Color.fromRGBO(147, 0, 119, 1)),
  ChartData('Awful', 34, Color.fromRGBO(228, 0, 124, 1)),
];
*/

class JournalPage extends StatefulWidget {
  JournalPage({Key key, this.userId, this.user})
      : super(key: key) {
    print("this is actual journalPage/n");
    print("this is user Id : " + userId);

    print(user.getSleepData());

    Map myMap = user.getSleepData();
    List list = [];
    List<DailyData> mapListed = [];
    myMap.forEach((key, value) {
      value.forEach((key0, value0) {
        print(value0);
        list.add(value0);
        mapListed
            .add(DailyData(value0['date'], value0['mood'], value0['nbHours']));
      });
    });
    print("***");
    print(myMap);
    print(list);
    print(mapListed);
    print("***");
  }
  Utilisateur user;

  final String userId;

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  /*** */

  String getMood(int value) {
    if (value < 3) {
      return ("Awful");
    } else if (value <= 5) {
      return ("Mediocre");
    } else if (value <= 8) {
      return ("Good");
    } else if (value >= 8) {
      return ("Very Good");
    }
  }

  myFunction() {
    int awfulCount = 0;
    int mediocreCount = 0;
    int goodCount = 0;
    int veryGoodCount = 0;
    double awfulPerc = 0;
    double mediocrePerc = 0;
    double goodPerc = 0;
    double veryGoodPerc = 0;
    int total = 0;
    List moodList = [];
    moodList = sleepHoursChartListing(widget.user.getSleepData());
    moodList.forEach((e) {
      print(e.mood);
      print(getMood(e.mood));
      if (getMood(e.mood) == 'Awful') {
        awfulCount++;
      } else if (getMood(e.mood) == 'Mediocre') {
        mediocreCount++;
      } else if (getMood(e.mood) == 'Good') {
        goodCount++;
      } else if (getMood(e.mood) == 'Very Good') {
        veryGoodCount++;
      }
      total = awfulCount + mediocreCount + goodCount + veryGoodCount;
      print(awfulCount);
      print(mediocreCount);
      print(goodCount);
      print(veryGoodCount);
      print(total);
    });
    awfulPerc = (awfulCount / total) * 100;
    mediocrePerc = (mediocreCount / total) * 100;
    goodPerc = (goodCount / total) * 100;
    veryGoodPerc = (veryGoodCount / total) * 100;
    moodList = [
      MoodData('Very Good', veryGoodPerc, Color.fromRGBO(255, 189, 57, 1)),
      MoodData('Good', goodPerc, Color.fromRGBO(9, 0, 136, 1)),
      MoodData('Mediocre', mediocrePerc, Color.fromRGBO(147, 0, 119, 1)),
      MoodData('Awful', awfulPerc, Color.fromRGBO(228, 0, 124, 1)),
    ];
    print(awfulPerc);
    print(mediocrePerc);
    print(goodPerc);
    print(veryGoodPerc);
    return (moodList);
  }

  /** */

  sleepHoursChartListing(dynamic map) {
    Map myMap = map;
    List list = [];
    List mapListed = [];
    myMap.forEach((key, value) {
      value.forEach((key0, value0) {
        list.add(value0);
        mapListed
            .add(DailyData(value0['date'], value0['nbHours'], value0['mood']));
      });
    });
    //List<DailyData> mapListedFinal = mapListed;
    return (mapListed);
  }

  @override
  Widget build(BuildContext context) {
    print('****-------****');
    print(sleepHoursChartListing(widget.user.getSleepData()));
    myFunction();
    print('****-------****');
    setState(() {
      print('setState');
    });
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('JournalPage'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /* Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Average Sleep Hours Chart : '),
              )),*/
              Center(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Sleep Hours Chart'),
                    // Enable legend
                    //legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<dynamic, String>>[
                      ColumnSeries<dynamic, String>(
                          dataSource: sleepHoursChartListing(
                              widget.user.getSleepData()),
                          xValueMapper: (x, _) => x.date,
                          yValueMapper: (y, _) => y.nbHours,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<dynamic, String>(
                          dataSource: myFunction(),
                          pointColorMapper: (data, _) => data.color,
                          xValueMapper: (data, _) => data.mood,
                          yValueMapper: (data, _) => data.percentage),
                    ],
                    title: ChartTitle(text: 'Average Mood After Waking Up'),
                    legend: Legend(isVisible: true),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: customNavBar(
          context,
          1,
          userId: widget.userId,
        
        ),
      ),
    );
  }
}
