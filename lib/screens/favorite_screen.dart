import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("nothing added yet"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
