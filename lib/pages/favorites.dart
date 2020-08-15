import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/recipe.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage({Key key, this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (favoriteMeals.length > 0)
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Recipe(
                key: key,
                meal: favoriteMeals[index],
              );
            },
            itemCount: favoriteMeals.length,
          )
        : Center(
            child: Text(
              'There is no favorites yet - start adding some!',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
  }
}
