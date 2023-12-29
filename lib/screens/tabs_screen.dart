
import 'package:flutter/material.dart';
import 'package:meal_selector/models/meal_model.dart';
import 'package:meal_selector/screens/category_screen.dart';
import 'package:meal_selector/screens/favourites_screen.dart';
import 'package:meal_selector/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    this._pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(this.widget.favouriteMeals), 'title': 'Favourites'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Top bar example
    // return DefaultTabController(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favourites'
    //           )
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //         CategoriesScreen(),
    //         FavouritesScreen()
    //       ],
    //     ),
    //   ),
    //   length: 2,
    // );

    // Bottom bar example
    return Scaffold(
      appBar: AppBar(
        title: Text(this._pages[this._selectedPageIndex]['title'])
      ),
      drawer: MainDrawer(),
      body: this._pages[this._selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: this._selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            this._selectedPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories')
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favourites')
          ),
        ],
      ),
    );
  }
}
