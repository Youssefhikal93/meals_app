import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/dummay_data.dart';
import 'package:meals_app/models/meals_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMealsAfterFiltering,
  });
  final List<MealModel> availableMealsAfterFiltering;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTappingCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = widget.availableMealsAfterFiltering
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(mealsList: filteredMeals, title: category.title),
      ),
    );
    // Navigator.of(context).push(route) same as push
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width >= 900
        ? 4
        : width >= 600
        ? 3
        : 2;
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
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
      ),
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeInOut,
                ),
              ),
          child: child,
        );
      },
    );
  }
}
