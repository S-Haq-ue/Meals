import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          "nothing added yet!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
