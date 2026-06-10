import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Providers/favoriates_provider.dart';
import 'package:meals_app/models/meals_model.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});

  final MealModel meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favList = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: favList.contains(meal)
                ? Icon(Icons.star_outlined, color: Colors.yellow)
                : Icon(Icons.star),
            onPressed: () {
              var result = ref
                  .read(favoritesProvider.notifier)
                  .toggleFavorite(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    result ? "Added" : "Removed",
                    textAlign: TextAlign.center,
                  ),
                  persist: false,
                  showCloseIcon: true,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 14),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            SizedBox(height: 10),
            for (var ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            SizedBox(height: 20),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            SizedBox(height: 10),
            for (var step in meal.steps)
              Text(
                textAlign: TextAlign.center,
                step,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
