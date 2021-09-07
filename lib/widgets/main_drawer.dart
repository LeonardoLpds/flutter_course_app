import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required Function callback,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: () => callback(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            icon: Icons.restaurant,
            title: "Meals",
            callback: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
            icon: Icons.settings,
            title: "Filtros",
            callback: () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
