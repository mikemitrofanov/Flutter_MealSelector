
import 'package:flutter/material.dart';
import 'package:meal_selector/config/meals.dart';
import 'package:meal_selector/models/meal_model.dart';
import 'package:meal_selector/widgets/meal_details.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function _toggleFavourite;
  final Function _isMealFavourite;

  MealDetailsScreen(this._toggleFavourite, this._isMealFavourite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal = MEALS.firstWhere((item) => item.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: selectedMeal != null ? MealDetails(selectedMeal, this._isMealFavourite) : Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(this._isMealFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          this._toggleFavourite(mealId);
          // Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
