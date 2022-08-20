import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';

import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    availableMeals = dummyMeals.where((element) {
      if (_filters['gluten'] == true && !element.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] == true && !element.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] == true && !element.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] == true && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  bool _isMealFavorite(String id) {
    return favoritedMeals.any((element) => element.id == id);
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        favoritedMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoritedMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeleMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        dividerColor: Colors.grey,
        //
        fontFamily: "Raleway",
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed",
          ),
        ),
      ),
      routes: {
        "/": (ctx) => TabsScreen(favoritedMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_isMealFavorite, _toggleFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
