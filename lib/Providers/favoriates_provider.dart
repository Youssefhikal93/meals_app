import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/models/meals_model.dart';

class FavoritesProvider extends StateNotifier<List<MealModel>> {
  FavoritesProvider() : super([]);

  bool toggleFavorite(MealModel meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesProvider, List<MealModel>>((ref) {
      return FavoritesProvider();
    });
