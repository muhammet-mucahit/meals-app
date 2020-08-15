import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/favorites.dart';
import 'package:meals_app/widgets/appbar.dart';
import 'package:meals_app/widgets/category_list.dart';
import 'package:meals_app/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.favoriteMeals});

  final String title;
  final List<Meal> favoriteMeals;

  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoryList(), 'title': 'Meals'},
      {
        'page': FavoritesPage(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(_pages[_selectedPageIndex]['title']),
      drawer: drawer(context),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        // backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
