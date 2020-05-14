import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'screens/constants.dart';
import 'screens/diet_recommendation.dart';
import 'screens/meditation.dart';
import 'package:flutter/widgets.dart';

import 'widgets.dart';

class HelpMeSleepPage extends StatefulWidget {
  @override
  _HelpMeSleepState createState() => _HelpMeSleepState();
}

class _HelpMeSleepState extends State<HelpMeSleepPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and width of our device
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Tips & Tricks'),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffeaf6ff),
      bottomNavigationBar: customNavBar(context, 0),
      body: Stack(
        children: <Widget>[
          Container(
            //here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.cyan[100],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Text(
                      "Say Goodbye to bad quality sleep !! ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display1.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.cyan[600],
                            fontSize: 30,
                          ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DietRecommendationPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Excercices for a better sleep",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MeditationPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MeditationPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Relaxing Music",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MeditationPage();
                            }));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
