import 'package:flutter/material.dart';
import 'package:tutorials_test/models/ArticleScreenClass.dart';
import 'List_Help_Me.dart';

class DietRecommendationPage extends StatefulWidget {
  @override
  _DietRecommendationPage createState() => _DietRecommendationPage();
}

class _DietRecommendationPage extends State<DietRecommendationPage> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ArticleScreen(article: articlesHelpMe[0], articleTitle: 'Diet Recommendation'),
            )
            );
  }
}
