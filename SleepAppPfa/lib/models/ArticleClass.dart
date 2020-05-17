import 'package:flutter/material.dart';

class Article {
  String imageUrl;
  List<String> miniTitles;
  List<String> paragraphes;

  String imageUrlA;
  String titleA;
  Article(
      {@required this.imageUrl,
      this.miniTitles,
      this.paragraphes,
      @required this.imageUrlA,
      @required this.titleA}) {}
}
