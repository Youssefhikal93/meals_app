import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/dummay_data.dart';
import 'package:meals_app/models/meals_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onAddingOrRemoveAFavMeals});
  final void Function(MealModel meal) onAddingOrRemoveAFavMeals;

  void _onTappingCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          mealsList: filteredMeals,
          title: category.title,
          onAddingOrRemoveAFavMeals: onAddingOrRemoveAFavMeals,
        ),
      ),
    );
    // Navigator.of(context).push(route) same as push
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItem(
            category: category,
            onTappingCategory: () => _onTappingCategory(context, category),
          ),
        ),
      ],
    );
  }
}
