import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';

import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/tabs_bottom.dart';

import './screens/category_mealscreen.dart';
import './screens/filter_screen.dart';
import './screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "glutenFree": false,
    "vegan": false,
    "vegetarian": false,
    "lactoseFree": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["glutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        if (_filters["lactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> _favoriteMeals = [];
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      theme: ThemeData(
        accentColor: Colors.brown.shade400,
        primaryColor: Colors.amberAccent.shade100,
        errorColor: Colors.black87,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 21, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title:
                  TextStyle(fontSize: 20, fontFamily: "RobotoCondensed-Bold"),
            ),
      ),
      //home: CategoryScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabScreenBottom(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_isFavorite, _toggleFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilter),
        SettingsScreen.routeName: (ctx) => SettingsScreen()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => CategoryMealsScreen(_availableMeals));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => CategoryMealsScreen(_availableMeals));
      },
    );
  }
}
