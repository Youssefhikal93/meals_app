import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/Providers/meals_provider.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:riverpod/riverpod.dart';

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilters(Map<Filter, bool> newFilters) {
    state = newFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
  (ref) {
    return FilterProvider();
  },
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);

  return meals
      .where(
        (element) =>
            (activeFilters[Filter.glutenFree]! ? element.isGlutenFree : true) &&
            (activeFilters[Filter.lactoseFree]!
                ? element.isLactoseFree
                : true) &&
            (activeFilters[Filter.vegetarian]! ? element.isVegetarian : true) &&
            (activeFilters[Filter.vegan]! ? element.isVegan : true),
      )
      .toList();
});
