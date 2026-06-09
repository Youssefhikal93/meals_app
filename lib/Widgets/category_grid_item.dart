import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onTappingCategory,
  });

  final CategoryModel category;
  final void Function() onTappingCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTappingCategory,
      splashColor: Theme.of(context).hintColor,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        key: ValueKey(category.id),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [category.color.withAlpha(100), category.color],
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
