import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Map<String, Object>> _pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': const FavoritesScreen(), 'title': 'Favorites'},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${_pages[_selectedPageIndex]['title']}"),
          centerTitle: true,
        ),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: const Color(0xff003D7A),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
      drawer: const MainDrawer(),

    );
  }
}
