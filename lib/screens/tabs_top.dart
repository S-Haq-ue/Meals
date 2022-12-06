import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import '../models/meal.dart';

class TabScreenTop extends StatelessWidget {
  List<Meal> favoriteMeal;
  TabScreenTop(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("meals"),
          backgroundColor: Theme.of(context).accentColor,
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home), text: "Categories"),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorite",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryScreen(),
            FavoriteScreen(favoriteMeal),
          ],
        ),
      ),
    );
  }
}
