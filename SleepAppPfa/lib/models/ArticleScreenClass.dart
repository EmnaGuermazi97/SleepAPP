import 'package:flutter/material.dart';
import 'package:tutorials_test/models/ArticleClass.dart';
import 'package:tutorials_test/widgets/articleStructure.dart';


class ArticleScreen extends StatefulWidget {
  final Article article;
  final String articleTitleAppBAR;
  ArticleScreen({this.article, this.articleTitleAppBAR});

  @override
   createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              leading: Container(),
              title: Text(widget.articleTitleAppBAR),
              centerTitle: true,
            ),
           // bottomNavigationBar: customNavBar(context, 0),
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
                        //  color: Colors.lightBlue[50],
                        color:Color.fromRGBO(143, 148, 251, 1),
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
                              top: 30.0,  bottom: 0.0),
                          child: Container(
                            height: 120.0,
                            child: Text(
                              widget.article.titleA,
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                               right: 2.0, left: 2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: AssetImage(widget.article.imageUrlA),
                              height: 300,
                              width: 500,
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
