import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Providers/favoriates_provider.dart';
import 'package:meals_app/Providers/filter_provider.dart';
import 'package:meals_app/Providers/meals_provider.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectTab(int tabIndex) {
    setState(() {
      _selectedPageIndex = tabIndex;
    });
  }

  void selectDrawerMenuItem(String identifier) async {
    Navigator.pop(context); // close the drawer first
    if (identifier == "filters") {
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (context) => FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String activePageTitle = "Categories";

    final favoritesMeals = ref.watch(favoritesProvider);
    final availableMealsAfterFiltering = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMealsAfterFiltering: availableMealsAfterFiltering,
    );

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(title: null, mealsList: favoritesMeals);
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
