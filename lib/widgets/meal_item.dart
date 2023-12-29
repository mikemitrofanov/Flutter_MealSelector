

import 'package:flutter/material.dart';
import 'package:meal_selector/models/meal_model.dart';
import 'package:meal_selector/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: this.id)
      .then((result) {
        if (result != null) {
          // this.removeItem(result);
        }
      });
  }

  String get complexityText {
    switch (this.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
    }

    return '';
  }

  String get affordabilityText {
    switch (this.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(this.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover)
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      this.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    )
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 6,),
                    Text('${this.duration} min')
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 6,),
                    Text('${this.complexityText}')
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    Text('${this.affordabilityText}')
                  ]),
                ],
              )
            )
          ],
        )
      )
    );
  }
}
