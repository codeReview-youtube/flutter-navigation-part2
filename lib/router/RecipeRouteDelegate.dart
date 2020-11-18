import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/AppShell.dart';
import 'package:flutter_navigation_part_2/router/RecipeDetailsPath.dart';
import 'package:flutter_navigation_part_2/router/RecipeListPath.dart';
import 'package:flutter_navigation_part_2/router/RecipeRoutePath.dart';
import 'package:flutter_navigation_part_2/router/RecipeSettingPath.dart';
import 'package:flutter_navigation_part_2/state/CakeRecipeState.dart';

class RecipeRouteDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  // get app state instance
  CakeRecipeState appState = CakeRecipeState();

  RecipeRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  @override
  Future<void> setNewRoutePath(RecipeRoutePath config) async {
    if (config is RecipeListPath) {
      // homeScreen
      appState.selectedIndex = 0;
      appState.selectedRecipe = null;
    } else if (config is RecipeDetailsPath) {
      // nested home/ details screen
      appState.setSelectedRecipeById(config.id);
    } else if (config is RecipeSettingPath) {
      // setting screen
      appState.selectedIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (appState.selectedRecipe != null) {
          appState.selectedRecipe = null;
        }
        notifyListeners();
        return true;
      },
      pages: [
        MaterialPage(
          child: AppShell(appState: appState), // appShell
        ),
      ],
    );
  }

  RecipeRoutePath get currentConfig {
    if (appState.selectedIndex == 1) {
      return RecipeSettingPath();
    } else {
      if (appState.selectedRecipe == null) {
        return RecipeListPath();
      } else {
        return RecipeDetailsPath(appState.getSelectedRecipeById());
      }
    }
  }
}
