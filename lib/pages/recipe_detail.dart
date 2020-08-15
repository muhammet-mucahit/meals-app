import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class RecipeDetailPage extends StatefulWidget {
  static const routeName = '/recipe_detail';

  final Function _isStarred;
  final Function _toggleFavorite;

  RecipeDetailPage(this._isStarred, this._toggleFavorite);

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  bool _isStarred;
  Meal recipe;

  @override
  void didChangeDependencies() {
    final recipeId = ModalRoute.of(context).settings.arguments;
    recipe = DUMMY_MEALS.firstWhere((recipe) => recipe.id == recipeId);
    _isStarred = widget._isStarred(recipeId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            icon: _isStarred
                ? Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : Icon(Icons.star_border),
            onPressed: () {
              setState(() {
                _isStarred = !_isStarred;
                widget._toggleFavorite(recipe.id);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      recipe.ingredients[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                itemCount: recipe.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(
                    recipe.steps[index],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                itemCount: recipe.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(recipe.id);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
