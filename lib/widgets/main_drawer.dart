import 'package:flutter/material.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawer(String title, IconData icon, Function onHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(title),
      onTap: onHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 150,
          width: double.infinity,
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).primaryColor,
          child: Text(
            "Cooking Up",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        buildDrawer("Meals", Icons.restaurant, () {
          Navigator.of(context).pushNamed("/");
        }),
        buildDrawer("Filter", Icons.filter_alt_outlined, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
        buildDrawer("Settings", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
        })
      ],
    ));
  }
}
