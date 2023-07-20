import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;

  const FiltersScreen({super.key, required this.saveFilters, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool _isGlutenFree = false;
   bool _isLactoseFree = false;
   bool _isVegetarian = false;
   bool _isVegan = false;
  @override
  void initState() {
    _isGlutenFree=widget.currentFilters['gluten'] as bool;
    _isLactoseFree=widget.currentFilters['lactose'] as bool;
    _isVegetarian=widget.currentFilters['vegetarian'] as bool;
    _isVegan=widget.currentFilters['vegan'] as bool;
    super.initState();
  }
Widget _buildSwitchListTile(
    String title,
    String description,
    Function(bool) updateValue,
    bool currentValue,
  ) {
    return SwitchListTile(
      title: Text(title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
      ),
      value: currentValue,
      subtitle: Text(description,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey[400],
      ),
      ),
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
            onPressed: () {
              final Map<String,bool> selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan,
              };
              widget.saveFilters(selectedFilters);
            },
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
