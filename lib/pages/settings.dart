import 'package:flutter/material.dart';
import 'package:meals_app/widgets/appbar.dart';
import 'package:meals_app/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  final Map<String, bool> _filters;
  final Function _saveFilters;

  const SettingsPage(this._filters, this._saveFilters);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _glutenFree;
  bool _lactoseFree;
  bool _vegetarian;
  bool _vegan;

  @override
  initState() {
    _glutenFree = widget._filters['gluten'];
    _lactoseFree = widget._filters['lactose'];
    _vegetarian = widget._filters['vegeterian'];
    _vegan = widget._filters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(title, subtitle, currentValue, updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegeterian': _vegetarian,
            'vegan': _vegan,
          };
          widget._saveFilters(selectedFilters);
        },
        child: Icon(Icons.save),
      ),
      drawer: drawer(context),
      appBar: appbar('Filters'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegeterian meals.',
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
