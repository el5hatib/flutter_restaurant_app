import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widget/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  const FiltersScreen({super.key, required this.saveFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool _isGlutenFree = false;
   bool _isLactoseFree = false;
   bool _isVegetarian = false;
   bool _isVegan = false;
Widget _buildSwitchListTile(
    String title,
    String description,
    Function(bool) updateValue,
    bool currentValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.saveFilters({
              'gluten':_isGlutenFree,
              'lactose':_isLactoseFree,
              'vegetarian':_isVegetarian,
              'vegan':_isVegan,
            }),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  (newValue) {
                    setState(() {
                      _isGlutenFree=newValue;
                    });
                  },
                    _isGlutenFree,
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  (newValue) {
                    setState(() {
                      _isLactoseFree=newValue;
                    });
                  },
                  _isLactoseFree,
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  (newValue) {
                    setState(() {
                      _isVegetarian=newValue;
                    });
                  },
                  _isVegetarian,
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  (newValue) {
                    setState(() {
                      _isVegan=newValue;
                    });
                  },
                  _isVegan,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
