import 'package:flutter/material.dart';
import 'package:meals_app/widgets/recipe.dart';

class RecipeList extends StatelessWidget {
  final List _categoryMeals;
  final Function removeRecipe;

  const RecipeList(this._categoryMeals, this.removeRecipe);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Recipe(
          key: key,
          meal: _categoryMeals[index],
          removeRecipe: removeRecipe,
        );
      },
      itemCount: _categoryMeals.length,
    );
  }
}
