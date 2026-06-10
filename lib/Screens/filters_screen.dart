import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Providers/filter_provider.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool glutenFreeSetter = false;
  bool lactoseFreeSetter = false;
  bool veganSetter = false;
  bool vegetarianSetter = false;

  @override
  void initState() {
    ref.read(filterProvider).forEach((filter, isActive) {
      switch (filter) {
        case Filter.glutenFree:
          glutenFreeSetter = isActive;
          break;
        case Filter.lactoseFree:
          lactoseFreeSetter = isActive;
          break;
        case Filter.vegan:
          veganSetter = isActive;
          break;
        case Filter.vegetarian:
          vegetarianSetter = isActive;
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        ref.read(filterProvider.notifier).setFilters({
          Filter.glutenFree: glutenFreeSetter,
          Filter.lactoseFree: lactoseFreeSetter,
          Filter.vegetarian: vegetarianSetter,
          Filter.vegan: veganSetter,
        });
        Navigator.of(context).pop();
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
