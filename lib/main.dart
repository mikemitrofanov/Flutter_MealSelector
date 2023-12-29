import 'package:flutter/material.dart';
import 'package:meal_selector/config/meals.dart';
import 'package:meal_selector/models/meal_model.dart';
import 'package:meal_selector/screens/category_screen.dart';
import 'package:meal_selector/screens/filters_screen.dart';
import 'package:meal_selector/screens/meal_details_screen.dart';
import 'package:meal_selector/screens/meals_list_screen.dart';
import 'package:meal_selector/screens/tabs_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  List<Meal> _availableMeals = MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;
      this._availableMeals = MEALS.where((item) {
        if (this._filters['gluten'] && !item.isGlutenFree) {
          return false;
        }

        if (this._filters['lactose'] && !item.isLactoseFree) {
          return false;
        }

        if (this._filters['vegan'] && !item.isVegan) {
          return false;
        }

        if (this._filters['vegeterian'] && !item.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((item) => item.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        this._favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        this._favouriteMeals.add(MEALS.firstWhere((item) => item.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String mealId) {
    return this._favouriteMeals.any((item) => item.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(this._favouriteMeals),
        MealsLListScreen.routeName: (ctx) => MealsLListScreen(this._availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(this._toggleFavourite, this._isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(this._setFilters, this._filters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      // onUnknownRoute: (settings) {
      //   // show crash error page
      //   print('unknown');
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },
    );
  }
}