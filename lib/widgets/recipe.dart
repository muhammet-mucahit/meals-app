import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/recipe_detail.dart';

class Recipe extends StatelessWidget {
  final Meal meal;
  final Function removeRecipe;

  const Recipe({Key key, this.meal, this.removeRecipe}) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.SIMPLE:
        return 'Simple';
        break;
      case Complexity.CHALLENGING:
        return 'Challenging';
        break;
      case Complexity.HARD:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.AFFORDABLE:
        return 'Affordable';
        break;
      case Affordability.PRICEY:
        return 'Pricey';
        break;
      case Affordability.LUXURIOUS:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final duration = meal.duration;

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(
          RecipeDetailPage.routeName,
          arguments: meal.id,
        )
            .then((value) {
          if (value != null) {
            removeRecipe(value);
          }
        });
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black38,
                    padding: EdgeInsets.all(10),
                    width: 300,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(
                        '$duration min',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(
                        complexityText,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(
                        affordabilityText,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
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
