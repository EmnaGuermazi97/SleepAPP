import 'package:flutter/material.dart';
import 'package:tutorials_test/models/articlesClasses.dart';
import 'package:tutorials_test/screens/ScreenArticle.dart';
import '../widgets.dart';

class DietRecommendationPage extends StatefulWidget {
  @override
  _DietRecommendationPage createState() => _DietRecommendationPage();
}

class _DietRecommendationPage extends State<DietRecommendationPage> {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
