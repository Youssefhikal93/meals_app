import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/main_drawer.dart';
import 'package:meals_app/models/dummay_data.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/Screens/filters_screen.dart';

var kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

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
  Map<Filter, bool> selectedFilters = kInitialFilters;

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

  void selectDrawerMenuItem(String identifier) async {
    Navigator.pop(context); // close the drawer first
    if (identifier == "filters") {
      final resultFromFilterPage = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = resultFromFilterPage ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String activePageTitle = "Categories";
    final availableMealsAfterFiltering = dummyMeals
        .where(
          (element) =>
              (selectedFilters[Filter.glutenFree]!
                  ? element.isGlutenFree
                  : true) &&
              (selectedFilters[Filter.lactoseFree]!
                  ? element.isLactoseFree
                  : true) &&
              (selectedFilters[Filter.vegetarian]!
                  ? element.isVegetarian
                  : true) &&
              (selectedFilters[Filter.vegan]! ? element.isVegan : true),
        )
        .toList();

    Widget activePage = CategoriesScreen(
      onAddingOrRemoveAFavMeals: addingOrRemoveAFavMeals,
      availableMealsAfterFiltering: availableMealsAfterFiltering,
    );

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
      drawer: MainDrawer(onSelectScreen: selectDrawerMenuItem),
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
