import 'package:flutter/material.dart';
import 'package:meal_selector/widgets/category_item.dart';

import '../config/categories.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: CATEGORIES.map((item) => CategoryItem(item.id, item.title, item.color)).toList(),
    );
  }
}
