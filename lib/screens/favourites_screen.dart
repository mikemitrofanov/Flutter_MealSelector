import 'package:flutter/material.dart';
import 'package:meal_selector/models/meal_model.dart';
import 'package:meal_selector/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {

    if (this.favouriteMeals.isEmpty) {
      return Container(
        child: Center(child: Text('You have no favourites yet'),),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: this.favouriteMeals[index].id,
            title: this.favouriteMeals[index].title,
            imageUrl: this.favouriteMeals[index].imageUrl,
            duration: this.favouriteMeals[index].duration,
            affordability: this.favouriteMeals[index].affordability,
            complexity: this.favouriteMeals[index].complexity
          );
        },
        itemCount: this.favouriteMeals.length,
      );
    }
  }
}
