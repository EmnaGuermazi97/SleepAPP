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

List<Article> articlesHelpMe = [
  Article(
      imageUrl: "assets/images/Habits.jpg",
      miniTitles: [
        '1.Complex Carbs',
        '2.A Handful of Nuts',
        '3.Cottage Cheese',
        '4.A Cup of Bedtime Tea',
        '5.A Cup of Bedtime Tea',
        '6.Fruits'
      ],
      paragraphes: [
                "Skip the white bread, refined pasta, and sugary, baked goods, which may reduce serotonin levels and impair sleep. Instead, choose stick-to-your-ribs whole grains for your bedtime snack: Popcorn, oatmeal, or whole-wheat crackers with nut butter are all good choices.",
                "Nuts are a good source of heart-healthy fats. And almonds and walnuts, specifically, contain melatonin, a hormone that helps to regulate your sleep/wake cycle. Eating them can increase your blood levels of the hormone, helping you sleep more soundly. ",
                "Foods that are high in lean protein, like cottage cheese, also pack the amino acid tryptophan, which may increase serotonin levels. Serotonin is a brain chemical and low levels of it can contribute to insomnia. To sweeten it up, top the cottage cheese with raspberries, which are rich sources of melatonin.",
                "A nightly cup of tea (sans caffeine, of course) can be a perfect relaxing ritual. Chamomile, ginger, and peppermint are calming choices for bedtime.",
                "Scientifically, there may be some link between the tryptophan and melatonin content of milk and improved sleep. But perhaps more powerful is the psychological link between warm milk and bedtime as a child. Just like hot tea, a warm drink of milk can provide the perfect soothing backdrop for a relaxing bedtime routine.",
                "Certain fruits that contain melatonin may help you fall asleep faster and wake up less often during the night. For instance, tart cherry juice and whole tart cherries contain a lot of melatonin, and bananas, pineapple, and oranges are also sources. If you have insomnia, eating two kiwis before bed can increase your sleep duration by an hour over the course of a month. Other fruits and vegetables that are rich in antioxidants (like berries, prunes, raisins, and plums) may have a similar effect by helping to counteract the oxidative stress caused by a sleep disorder."

         ],
      imageUrlA: "assets/images/Foods-that-Help-You-Sleep-Circle.png",
      titleA: "Grocery list for more restful nights."),
  
];
