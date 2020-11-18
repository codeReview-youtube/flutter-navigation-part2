import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation_part_2/models/recipe_model.dart';

class CakeRecipeState extends ChangeNotifier {
  int _selectedIndex;
  Recipe _selectedRecipe;

  final List<Recipe> recipes = [
    Recipe(name: 'Pumpkin Cake', catagory: 'Squash recipes', chef: 'Sue Case'),
    Recipe(
        name: "Grandma's Chocolate Texas Sheet Cake",
        catagory: 'Sheet cake',
        chef: 'Bakah Miller'),
    Recipe(
        name: 'Apple Upside-Down cake',
        catagory: 'Apple desserts',
        chef: 'Amber'),
    Recipe(
        name: 'Maple Buttercream Frosting',
        catagory: 'Buttercream frosting',
        chef: 'Sarah'),
  ];

  CakeRecipeState() : _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int v) {
    _selectedIndex = v;
    if (_selectedIndex == 1) {
      _selectedRecipe = null;
    }
    notifyListeners();
  }

  set selectedRecipe(Recipe value) {
    _selectedRecipe = value;
    notifyListeners();
  }

  Recipe get selectedRecipe => _selectedRecipe;

  int getSelectedRecipeById() {
    if (!recipes.contains(_selectedRecipe)) return 0;
    return recipes.indexOf(_selectedRecipe);
  }

  void setSelectedRecipeById(int id) {
    if (id < 0 || id > recipes.length - 1) {
      return;
    }
    _selectedRecipe = recipes[id];
    notifyListeners();
  }
}
