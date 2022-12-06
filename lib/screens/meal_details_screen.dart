import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meals-details";
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailsScreen(this.isMealFavorite, this.toggleFavorite);

  Widget buildSelectionTitle(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Text(
        "INGREDIANTS",
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child, AppBar appBar) {
    return Container(
      height:
          (MediaQuery.of(context).size.height - appBar.preferredSize.height) *
              0.4,
      width: (MediaQuery.of(context).size.width) * 0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mid = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mid);
    final appBar = AppBar(
      title: Text(
        "${selectedMeal.title}",
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            isMealFavorite(mid) ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () => toggleFavorite(mid),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  .35,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            buildSelectionTitle(context, "INGREDIENTS"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
              appBar,
            ),
            buildSelectionTitle(context, "STEPS"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${(index + 1)}"),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
              appBar,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mid);
        },
      ),
    );
  }
}
