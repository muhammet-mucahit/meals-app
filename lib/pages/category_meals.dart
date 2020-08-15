import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/appbar.dart';
import 'package:meals_app/widgets/recipe_list.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category_meals';

  final List<Meal> meals;

  const CategoryMealsPage(this.meals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget.meals
          .where((element) => element.categories.contains(categoryId))
          .toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void removeRecipe(recipeId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == recipeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(categoryTitle),
      body: Center(
        child: RecipeList(categoryMeals, removeRecipe),
      ),
    );
  }
}
