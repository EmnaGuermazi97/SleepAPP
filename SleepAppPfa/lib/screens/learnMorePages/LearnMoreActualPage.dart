import 'package:flutter/material.dart';
import 'package:tutorials_test/models/learnMoreArticlesClasses.dart';
import 'package:tutorials_test/widgets/articleStructure.dart';

class ArticleLearnScreen extends StatefulWidget {
  final ArticleLearnMore article;
  final def =
      'Sleep is: \n\nA condition of body and mind which typically recurs for several hours every night, in which the nervous system is inactive, the eyes closed, the postural muscles relaxed, and consciousness practically suspended.\n\nSleep is the mother of all health issues.  \n Most people do not understand what the lack of sleep or poor sleep efficiency is doing to them. \n Impaired sleep prevents your body from doing its nightly system recharge which doesn’t just cause fatigue but has been shown to: \n\n - Slow down your metabolism \n -impact weight and fat gain \n -weaken your immune system \n - impair your memory and ability to think clearly, reason and problem solving \n - hormone imbalances \n - accelerates aging process \n - worsen current health issues like heart ';
  ArticleLearnScreen({this.article});

  @override
  _ArticleLearnScreenState createState() => _ArticleLearnScreenState();
}

class _ArticleLearnScreenState extends State<ArticleLearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, top: 40.0, left: 20.0, bottom: 00.0),
                child: Container(
                    height: 450.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //add blue shadow
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue[50],
                          // has the effect of softening the shadow
                          spreadRadius:
                              4.0, // has the effect of extending the shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60.0, left: 20.0, bottom: 0.0),
                          child: Container(
                            height: 120.0,
                            color: Colors.white,
                            child: Text(
                              widget.article.titleA,
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, right: 2.0, left: 2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: AssetImage(widget.article.imageUrlA),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Column(
            children: widget.article.miniTitles
                .map((f) => articleStructure(
                    title: widget.article
                        .miniTitles[widget.article.miniTitles.indexOf(f)],
                    paragraphe: widget.article
                        .paragraphes[widget.article.miniTitles.indexOf(f)]))
                .toList(),
          ),
        ],
      ),
    ));
  }
}
