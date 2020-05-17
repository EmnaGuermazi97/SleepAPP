import 'package:flutter/material.dart';
import 'package:tutorials_test/models/articlesClasses.dart';
import 'package:tutorials_test/screens/helpMeSleepPages/ScreenArticle.dart';
import 'package:tutorials_test/widgets.dart';



class DietRecommendationPage extends StatefulWidget {
  @override
  _DietRecommendationPage createState() => _DietRecommendationPage();
}

class _DietRecommendationPage extends State<DietRecommendationPage> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: Text("Diet Recommendation"),
              centerTitle: true,
            ),
            bottomNavigationBar: customNavBar(context, 0),
            body: ScreenArticle(article: articlesHelpMe[0],),
          
            )
            );
  }
}
