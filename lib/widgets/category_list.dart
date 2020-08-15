import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category.dart';
import '../dummy_data.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: categories
          .map(
            (category) => CategoryWidget(
              category.id,
              category.title,
              category.color,
            ),
          )
          .toList(),
    );

    // return GridView.count(
    //   padding: EdgeInsets.all(10),
    //   crossAxisCount: 2,
    //   children: categories
    //       .map(
    //         (category) => CategoryWidget(
    //           key,
    //           category['name'],
    //           category['color'],
    //         ),
    //       )
    //       .toList(),
    // );
  }
}
