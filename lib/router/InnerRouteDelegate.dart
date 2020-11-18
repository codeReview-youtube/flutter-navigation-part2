import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/RecipeRoutePath.dart';
import 'package:flutter_navigation_part_2/screens/FadeAnimationPage.dart';
import 'package:flutter_navigation_part_2/screens/RecipeDetailsScreen.dart';
import 'package:flutter_navigation_part_2/screens/RecipeListScreen.dart';
import 'package:flutter_navigation_part_2/screens/SettingScreen.dart';
import 'package:flutter_navigation_part_2/state/CakeRecipeState.dart';

class InnerRouteDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  CakeRecipeState _appState;

  CakeRecipeState get appState => _appState;

  set appState(CakeRecipeState newState) {
    if (newState == _appState) {
      return;
    }
    _appState = newState;
    notifyListeners();
  }

  InnerRouteDelegate(this._appState);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      pages: [
        if (appState.selectedIndex == 0) ...[
          FadeAnimationPage(
            child: RecipeListScreen(
              recipes: appState.recipes,
              onTap: (recipe) {
                appState.selectedRecipe = recipe;
                notifyListeners();
              },
            ),
          ),
          if (appState.selectedRecipe != null)
            MaterialPage(
              key: ValueKey(appState.selectedRecipe),
              child: RecipeDetailsScreen(recipe: appState.selectedRecipe),
            )
        ] else
          FadeAnimationPage(
            child: SettingScreen(),
            key: ValueKey('Setting'),
          )
      ],
      onPopPage: (route, result) {
        appState.selectedRecipe = null;
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RecipeRoutePath config) async {
    assert(true);
  }
}
