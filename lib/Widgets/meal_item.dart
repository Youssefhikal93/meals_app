import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meal_details.dart';
import 'package:meals_app/Widgets/mea_item_trait.dart';
import 'package:meals_app/models/meals_model.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onAddingOrRemoveAFavMeals,
  });
  final void Function(MealModel meal) onAddingOrRemoveAFavMeals;

  final MealModel meal;
  String get normalizeComplexly =>
      meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  String get normalizeAffordability =>
      meal.affordability.name[0].toUpperCase() +
      meal.affordability.name.substring(1);

  void _onTapping(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetails(
          meal: meal,
          onAddingOrRemoveAFavMeals: onAddingOrRemoveAFavMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      clipBehavior:
          Clip.hardEdge, // enforce the style of the card over teh stack
      elevation: 5,
      child: InkWell(
        onTap: () => _onTapping(context),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/images/placeholder.png'),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: "${meal.duration} mins",
                        ),
                        SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: normalizeComplexly,
                        ),
                        SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.money,
                          label: normalizeAffordability,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Meal {}
