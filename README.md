# Meals App

A Flutter application for browsing meal categories, viewing meal details, managing favorites, and filtering meals by dietary preferences.

## Features

- **Browse Categories** — Explore meals organized by category.
- **Meal Details** — View ingredients, steps, and dietary info for each meal.
- **Favorites** — Add or remove meals from your personal wishlist.
- **Filters** — Filter meals by:
  - Gluten-free
  - Lactose-free
  - Vegan
  - Vegetarian

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── category_model.dart
│   ├── meals_model.dart
│   └── dummay_data.dart
├── Screens/
│   ├── categories.dart
│   ├── meals.dart
│   ├── meal_details.dart
│   ├── filters_screen.dart
│   └── tabs.dart
└── Widgets/
    ├── category_grid_item.dart
    ├── meal_item.dart
    ├── mea_item_trait.dart
    └── main_drawer.dart
```

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd meals_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Requirements

- Flutter SDK `^3.12.1`
- Dart SDK `^3.12.1`


- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
