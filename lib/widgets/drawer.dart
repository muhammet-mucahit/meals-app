import 'package:flutter/material.dart';
import 'package:meals_app/pages/home.dart';
import 'package:meals_app/pages/settings.dart';

Widget drawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Center(
            child: Text(
              'Cooking!',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          leading: Icon(Icons.fastfood),
          title: Text('Meals'),
          onTap: () {
            Navigator.pushReplacementNamed(context, MyHomePage.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.filter_tilt_shift),
          title: Text('Filters'),
          onTap: () {
            Navigator.pushReplacementNamed(context, SettingsPage.routeName);
          },
        ),
      ],
    ),
  );
}
