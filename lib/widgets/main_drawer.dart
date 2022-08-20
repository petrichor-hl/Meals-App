import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "RobotoCondensed",
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // child: Column(
      //   children: [
      //     Container(
      //       alignment: Alignment.centerLeft,
      //       padding: const EdgeInsets.all(16),
      //       color: Colors.amber,
      //       width: double.infinity,
      //       height: 200,
      //       child: Text(
      //         "Cooking Up!",
      //         style: TextStyle(
      //           color: Theme.of(context).primaryColor,
      //           fontSize: 30,
      //           fontWeight: FontWeight.w900,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 20),
      //     buildListTile(
      //       "Meals",
      //       Icons.restaurant,
      //     ),
      //     buildListTile(
      //       "Filters",
      //       Icons.settings,
      //     ),
      //   ],
      // ),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(16),
            color: Colors.amber,
            width: double.infinity,
            height: 250,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
