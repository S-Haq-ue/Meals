import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/favorite-screen";
  final Function saveFilter;
  Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter["glutenFree"];
    _vegan = widget.currentFilter["vegan"];
    _vegetarian = widget.currentFilter["vegetarian"];
    _lactoseFree = widget.currentFilter["lactoseFree"];
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedfilters = {
                "glutenFree": _glutenFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
                "lactoseFree": _lactoseFree,
              };
              widget.saveFilter(_selectedfilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Select your filter",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "GlutenFree",
                  "only GlutenFree meals represents",
                  _glutenFree,
                  (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "only Vegan meals represents",
                  _vegan,
                  (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "only Vegetarian meals represents",
                  _vegetarian,
                  (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "LactoseFree",
                  "only LactoseFree meals represents",
                  _lactoseFree,
                  (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
