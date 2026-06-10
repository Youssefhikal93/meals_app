import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFreeSetter = false;
  bool lactoseFreeSetter = false;
  bool veganSetter = false;
  bool vegetarianSetter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),
      body: Column(
        children: [
          SwitchListTile(
            value: glutenFreeSetter,
            onChanged: (isChecked) => setState(() {
              glutenFreeSetter = isChecked;
            }),
            title: Text(
              "Gluten free",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          ),
          SwitchListTile(
            value: lactoseFreeSetter,
            onChanged: (isChecked) => setState(() {
              lactoseFreeSetter = isChecked;
            }),
            title: Text(
              "Lactose free",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              "Only include lactose-free meals.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          ),
          SwitchListTile(
            value: veganSetter,
            onChanged: (isChecked) => setState(() {
              veganSetter = isChecked;
            }),
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              "Only include vegan meals.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          ),
          SwitchListTile(
            value: vegetarianSetter,
            onChanged: (isChecked) => setState(() {
              vegetarianSetter = isChecked;
            }),
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              "Only include vegetarian meals.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
              ),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          ),
        ],
      ),
    );
  }
}
