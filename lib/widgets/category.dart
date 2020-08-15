import 'package:flutter/material.dart';
import 'package:meals_app/pages/category_meals.dart';

class CategoryWidget extends StatelessWidget {
  final _id;
  final _title;
  final _color;

  const CategoryWidget(this._id, this._title, this._color);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMealsPage.routeName,
          arguments: {
            'id': _id,
            'title': _title,
          },
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: borderRadius,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color.withOpacity(0.7),
              _color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            _title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
