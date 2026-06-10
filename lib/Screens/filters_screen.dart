import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFreeSetter = false;
  bool lactoseFreeSetter = false;
  bool veganSetter = false;
  bool vegetarianSetter = false;

  @override
  void initState() {
    glutenFreeSetter = widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeSetter = widget.currentFilters[Filter.lactoseFree]!;
    veganSetter = widget.currentFilters[Filter.vegan]!;
    vegetarianSetter = widget.currentFilters[Filter.vegetarian]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        Navigator.of(context).pop({
          Filter.glutenFree: glutenFreeSetter,
          Filter.lactoseFree: lactoseFreeSetter,
          Filter.vegetarian: veganSetter,
          Filter.vegan: vegetarianSetter,
        });
      },
      child: Scaffold(
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
      ),
    );
  }
}
