import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  Theme.of(context).colorScheme.primaryFixedDim,
                ],
                begin: AlignmentGeometry.bottomEnd,
                end: AlignmentGeometry.bottomRight,
              ),
            ),
            padding: EdgeInsetsGeometry.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 18),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onTap: () => {onSelectScreen("meals")},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onTap: () => {onSelectScreen("filters")},
          ),
        ],
      ),
    );
  }
}
