import 'package:flutter/material.dart';
import 'package:tutorials_test/models/ArticleScreenClass.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

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
            appBar: AppBar(
              leading: Container(),
              title: Text("Exercices For Better Sleep"),
              centerTitle: true,
            ),
            bottomNavigationBar: customNavBar(context, 0),
            body: ArticleScreen(article: articlesHelpMe[1]),
            
          
            )
            );
  }
}
