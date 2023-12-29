
import 'package:flutter/material.dart';
import 'package:meal_selector/models/meal_model.dart';
import 'package:meal_selector/widgets/meal_item.dart';
import '../config/meals.dart';

class MealsLListScreen extends StatefulWidget {
  static const routeName = '/meals';

  final List<Meal> availableMeals;

  MealsLListScreen(this.availableMeals);

  @override
  _MealsLListScreenState createState() => _MealsLListScreenState();
}

class _MealsLListScreenState extends State<MealsLListScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitialData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!this._loadedInitialData) {
      final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
      this.categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      this.displayedMeals =
        this.widget.availableMeals.where((item) => item.categories.contains(categoryId)).toList();

      this._loadedInitialData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      this.displayedMeals.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: this.displayedMeals[index].id,
            title: this.displayedMeals[index].title,
            imageUrl: this.displayedMeals[index].imageUrl,
            duration: this.displayedMeals[index].duration,
            affordability: this.displayedMeals[index].affordability,
            complexity: this.displayedMeals[index].complexity
          );
        },
        itemCount: this.displayedMeals.length,
      ),
    );
  }
}
