import 'package:flutter/material.dart';
import 'package:tutorials_test/models/ArticleScreenClass.dart';
import 'List_Help_Me.dart';

class ExercicesPage extends StatefulWidget {
  @override
  _ExercicesPage createState() => _ExercicesPage();
}

class _ExercicesPage extends State<ExercicesPage> {
  Widget build(BuildContext context) {
      print(articlesHelpMe.length);
    return SafeArea(
        child: Scaffold(
            body: ArticleScreen(article: articlesHelpMe[1], articleTitleAppBAR: "Exercices",),
            )
            );
  }
}
