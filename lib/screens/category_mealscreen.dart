import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String cTitle;
  List<Meal> displayedMeal;
  var _loadedinitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedinitData) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cTitle = routeArg["title"];
      final id = routeArg["id"];
      displayedMeal = widget._availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadedinitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cTitle),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
            removeMeal: _removeItem,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
