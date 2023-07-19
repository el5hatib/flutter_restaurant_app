import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),*/
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 33,
          mainAxisSpacing: 33,
        ),
        children: dummyCategory.map((e) {
          return CategoryItem(
            id: e.id,
            title: e.title,
            color: e.color,
          );
        }).toList(),
      ),
    );
  }
}
