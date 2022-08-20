import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  const FavoritesScreen(this.favoritedMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return const Center(
        child: Text("You have no favorites yet -  start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          Meal meal = favoritedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
