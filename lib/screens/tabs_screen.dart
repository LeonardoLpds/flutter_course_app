import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _screens = [
    {"page": CategoriesScreen(), "title": "Categorias"},
    {"page": FavoritesScreen(), "title": "Seus favoritos"}
  ];
  int _screenSelected = 0;

  void _selectPage(int index) {
    setState(() {
      _screenSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_screenSelected]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_screenSelected]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _screenSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
