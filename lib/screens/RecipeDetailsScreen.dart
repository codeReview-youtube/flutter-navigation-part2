import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final ValueKey key;
  final Recipe recipe;

  RecipeDetailsScreen({this.key, @required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.of(context).pop(); },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (this.recipe != null) ...[
              Text(this.recipe.name,
                  style: Theme.of(context).textTheme.headline5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(this.recipe.catagory,
                      style: Theme.of(context).textTheme.subtitle1),
                  Text(this.recipe.chef,
                      style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
            ] else
              Text('error printing this recipe'),
          ],
        ),
      ),
    );
  }
}
