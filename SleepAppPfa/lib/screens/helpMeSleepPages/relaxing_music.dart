import 'package:flutter/material.dart';
import 'package:tutorials_test/models/CategoryCardClass.dart';
import 'package:tutorials_test/screens/helpMeSleepPages/peaceful_melody1.dart';
import 'package:tutorials_test/screens/helpMeSleepPages/peaceful_melody2.dart';
import 'package:tutorials_test/screens/helpMeSleepPages/peaceful_melody3.dart';
import 'package:tutorials_test/screens/helpMeSleepPages/rain_drops.dart';

class RelaxingMusic extends StatefulWidget {
  @override
  _RelaxingMusicState createState() => _RelaxingMusicState();
}

class _RelaxingMusicState extends State<RelaxingMusic> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Text(
                      "Your play List for better Sleep!!",
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
                          title: "Rain Drops",
                          imgSrc: "assets/images/rainDrops1.jpg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RainDropsSongPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Peaceful Melody n°1",
                          imgSrc: "assets/images/piano.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FirstSongPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Peaceful Melody n°2",
                          imgSrc: "assets/images/instrument.jpg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SecondeSongPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Peaceful Melody n°3",
                          imgSrc: "assets/images/guitare.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ThirdSongPage();
                            }));
                          },
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
