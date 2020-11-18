import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/recipe_model.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final ValueChanged<Recipe> onTap;

  RecipeListScreen({
    @required this.recipes,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView(
        children: [
          for (var recipe in this.recipes)
            ListTile(
              title: Text(recipe.name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(recipe.catagory),
                  Text(recipe.chef),
                ],
              ),
              onTap: () => this.onTap(recipe),
            )
        ],
      ),
    );
  }
}
