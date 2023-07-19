import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color:  const Color(0xff003D7A),
            child: Text(
              'Cooking Up!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          ),
        ],
      ),
    );
  }
}
