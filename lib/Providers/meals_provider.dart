import "package:meals_app/models/dummay_data.dart";
import 'package:riverpod/riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
