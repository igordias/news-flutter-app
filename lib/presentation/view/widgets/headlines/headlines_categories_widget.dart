import 'package:flutter/material.dart';
import 'package:flutterapptemplate/domain/entity/category.dart';

class HeadlinesCategoriesWidget extends StatelessWidget {
  int _selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    final categories = Categories.getAll();
    return Scaffold(
        body: Column(
      children: <Widget>[
        ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              ChoiceChip(
                label: Text(categories[index]),
                selected: _selectedCategoryIndex == index,
                onSelected: (bool selected) {},
              );
            })
      ],
    ));
  }
}
