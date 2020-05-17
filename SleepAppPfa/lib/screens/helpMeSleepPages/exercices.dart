import 'package:flutter/material.dart';
import 'package:tutorials_test/models/articlesClasses.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

import 'ScreenArticle.dart';

class ExercicesPage extends StatefulWidget {
  @override
  _ExercicesPage createState() => _ExercicesPage();
}

class _ExercicesPage extends State<ExercicesPage> {
  Widget build(BuildContext context) {
      print(articlesHelpMe.length);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: Text("Exercices For Better Sleep"),
              centerTitle: true,
            ),
            bottomNavigationBar: customNavBar(context, 0),
            body: ScreenArticle(article: articlesHelpMe[1]),
            
          
            )
            );
  }
}
