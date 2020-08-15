import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/category_meals.dart';
import 'package:meals_app/pages/home.dart';
import 'package:meals_app/pages/recipe_detail.dart';
import 'package:meals_app/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = 'Meals App';

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegeterian': false,
    'vegan': false,
  };

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void saveFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _meals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegeterian'] && !meal.isVegetarian) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(int mealId) {
    if (isStarred(mealId)) {
      setState(() {
        _favoriteMeals.removeWhere((meal) => meal.id == meal.id);
      });
    } else {
      setState(() {
        _favoriteMeals.add(_meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isStarred(mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    return (existingIndex >= 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blueGrey,
        // canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Colors.grey[100]),
              headline1: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                color: Color.fromRGBO(20, 51, 51, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(
              title: title,
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsPage.routeName: (context) => CategoryMealsPage(_meals),
        RecipeDetailPage.routeName: (context) =>
            RecipeDetailPage(isStarred, _toggleFavorite),
        SettingsPage.routeName: (context) => SettingsPage(
              _filters,
              saveFilters,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (context) => MyHomePage(title: title),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MyHomePage(title: title),
        );
      },
    );
  }
}
