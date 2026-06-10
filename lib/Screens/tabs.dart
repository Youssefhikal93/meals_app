import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/models/meals_model.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<MealModel> favoritesMeals = [];

  void _selectTab(int tabIndex) {
    setState(() {
      _selectedPageIndex = tabIndex;
    });
  }

  void showInfoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, textAlign: TextAlign.center),
        persist: false,
        showCloseIcon: true,
      ),
    );
  }

  void addingOrRemoveAFavMeals(MealModel meal) {
    var isExists = favoritesMeals.where((m) => meal.id == m.id).isNotEmpty;
    setState(() {
      if (isExists) {
        favoritesMeals.remove(meal);
        showInfoMessage("Removed");
      } else {
        favoritesMeals.add(meal);
        showInfoMessage("Added to fav");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onAddingOrRemoveAFavMeals: addingOrRemoveAFavMeals,
    );
    String activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        title: null,
        mealsList: favoritesMeals,
        onAddingOrRemoveAFavMeals: addingOrRemoveAFavMeals,
      );
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _selectTab(value),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Wishlist"),
        ],
      ),
    );
  }
}
