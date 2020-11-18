import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/router/InnerRouteDelegate.dart';
import 'package:flutter_navigation_part_2/state/CakeRecipeState.dart';

class AppShell extends StatefulWidget {
  CakeRecipeState appState;

  AppShell({@required this.appState});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppShell> {
  InnerRouteDelegate _innerRouteDelegate;
  ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _innerRouteDelegate = InnerRouteDelegate(widget.appState);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher
        .createChildBackButtonDispatcher();
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _innerRouteDelegate.appState = widget.appState;
  }

  @override
  Widget build(BuildContext context) {
    var appState = widget.appState;
    return Scaffold(
      body: Router(
        routerDelegate: _innerRouteDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: appState.selectedIndex,
        onTap: (inx) {
          appState.selectedIndex = inx;
        },
      ),
    );
  }
}
