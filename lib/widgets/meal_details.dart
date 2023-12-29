
import 'package:flutter/material.dart';
import 'package:meal_selector/config/meals.dart';
import 'package:meal_selector/models/meal_model.dart';

class MealDetails extends StatelessWidget {
  final Meal selectedMeal;
  Function _isMealFavourite;

  MealDetails(this.selectedMeal, this._isMealFavourite);

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.title,),
      );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(this.selectedMeal.imageUrl, fit: BoxFit.cover,)
          ),
          this._buildSectionTitle(context, 'Ingredients'),
          this._buildContainer(ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(this.selectedMeal.ingredients[index])),
            ),
            itemCount: this.selectedMeal.ingredients.length,
          )),
          this._buildSectionTitle(context, 'Steps'),
          this._buildContainer(ListView.builder(
            itemBuilder: (ctx, index) => Column(children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text('#${index + 1}')
                ),
                title: Text(this.selectedMeal.steps[index]),
              ),
              Divider(height: 3, color: Colors.black,)
            ]),
            itemCount: this.selectedMeal.steps.length,
          ))
        ],
      ),
    );
  }
}
