import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/models/meals_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.mealsList});

  final String? title;
  final List<MealModel> mealsList;

  @override
  Widget build(BuildContext context) {
    var content = mealsList.isNotEmpty
        ? ListView.builder(
            itemCount: mealsList.length,
            itemBuilder: (context, index) => MealItem(meal: mealsList[index]),
          )
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "😔 No meals yet!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize:
                        Theme.of(context).textTheme.bodyLarge!.fontSize! * 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "🍽️ Try selecting a different category!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(100),
                  ),
                ),
              ],
            ),
          );

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
