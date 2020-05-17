import 'package:flutter/material.dart';
import 'package:tutorials_test/models/ArticleScreenClass.dart';
import 'package:tutorials_test/models/ArticleClass.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';
import 'List_learn_more.dart';

class LearnMorePage extends StatefulWidget {
  @override
  _LearnMorePageState createState() => _LearnMorePageState();
}

class _LearnMorePageState extends State<LearnMorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Learn More"),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffeaf6ff),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.cyan[50],
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlue[100],
                        // has the effect of softening the shadow
                        spreadRadius:
                            4.0, // has the effect of extending the shadow
                      )
                    ],
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 200.0,
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Importance of sleep',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sleep is an important part of your daily routine.You spend about one-third of your time doing it.  Quality sleep and getting enough of it at the right times is as essential to survival as food and water.  Without sleep you can’t form or maintain the pathways in your brain that let you learn and create new memories, and it’s harder to concentrate and respond quickly.",
                              textAlign: TextAlign.left,
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      Article article = articles[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ArticleScreen(article: article),
                          ),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(12.0),
                            width: 240.0,
                            height: 105.0,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(12.0),
                                  height: 280.0,
                                  width: 220.0,
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 280.0,
                                          width: 220.0,
                                          image: AssetImage(article.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  ),
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: customNavBar(context, 0),
      ),
    );
  }
}
