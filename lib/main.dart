import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/RecipeRouteDelegate.dart';
import 'package:flutter_navigation_part_2/router/RecipeRouteInformationParser.dart';

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  final RecipeRouteDelegate _recipeRouteDelegate = RecipeRouteDelegate();
  final RecipeRouteInformationParser _informationParser =
      RecipeRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title:'Nested Route',
      routeInformationParser: _informationParser,
      routerDelegate: _recipeRouteDelegate,
    );
  }
}
