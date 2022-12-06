import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeMeal;
  MealsItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    this.removeMeal,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        {
          return ("simple");
          break;
        }
      case (Complexity.Challenging):
        {
          return ("Challenging");
          break;
        }
      case Complexity.Hard:
        {
          return ("Hard");
          break;
        }
      default:
        {
          return ("Unknown");
          break;
        }
    }
  }

  String get affordablityText {
    switch (affordability) {
      case Affordability.Affordable:
        {
          return ("Affordable");
          break;
        }
      case Affordability.Pricey:
        {
          return ("Pricey");
          break;
        }
      case Affordability.Luxurious:
        {
          return ("Luxurious");
          break;
        }
      default:
        {
          return ("Unknown");
          break;
        }
    }
  }

  void selectmeals(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        removeMeal(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeals(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      Text("$duration mnts"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.money),
                      Text(affordablityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
