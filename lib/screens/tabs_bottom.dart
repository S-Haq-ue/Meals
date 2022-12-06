import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';
import './category_screen.dart';
import './favorite_screen.dart';
import '../models/meal.dart';

class TabScreenBottom extends StatefulWidget {
  List<Meal> favoriteMeal;
  TabScreenBottom(this.favoriteMeal);
  @override
  _TabScreenBottomState createState() => _TabScreenBottomState();
}

class _TabScreenBottomState extends State<TabScreenBottom> {
  List<Map<String, Object>> _pages;
  int _selectIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page": CategoryScreen(),
        "title": "Caregories",
      },
      {
        "page": FavoriteScreen(widget.favoriteMeal),
        "title": "Favorites",
      },
    ];
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectIndex]["title"]),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.home),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
        ],
      ),
    );
  }
}
