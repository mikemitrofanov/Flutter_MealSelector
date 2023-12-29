import 'package:flutter/material.dart';
import 'package:meal_selector/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();

    this._glutenFree = this.widget.currentFilters['guten'];
    this._vegeterian = this.widget.currentFilters['vegeterian'];
    this._vegan = this.widget.currentFilters['vegan'];
    this._lactoseFree = this.widget.currentFilters['lactose'];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final Map<String, bool> _filters = {
              'gluten': this._glutenFree,
              'lactose': this._lactoseFree,
              'vegan': this._vegan,
              'vegeterian': this._vegeterian
            };

            this.widget.saveFilters(_filters);
          })
        ],
      ),
      // drawer: MainDrawer(),
      body:  Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Your meal selection', style: Theme.of(context).textTheme.title)
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-free'),
                  value: this._glutenFree,
                  subtitle: Text('Only include gluten free'),
                  onChanged: (newValue) => setState(() {this._glutenFree = newValue;})
                ),
                SwitchListTile(
                  title: Text('Vegeterian'),
                  value: this._vegeterian,
                  subtitle: Text('Only include vegeterian'),
                  onChanged: (newValue) => setState(() {this._vegeterian = newValue;})
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: this._vegan,
                  subtitle: Text('Only include vegan'),
                  onChanged: (newValue) => setState(() {this._vegan = newValue;})
                ),
                SwitchListTile(
                  title: Text('Lactose free'),
                  value: this._lactoseFree,
                  subtitle: Text('Only include lactose free'),
                  onChanged: (newValue) => setState(() {this._lactoseFree = newValue;})
                )
              ],
            )
          )
        ],)
      ),
    );
  }
}
