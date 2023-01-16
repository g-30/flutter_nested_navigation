// ignore_for_file: prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_tab_item.dart';

typedef NestedNavigatorBarBuilder = BottomNavigationBar Function({ required List<BottomNavigationBarItem> items, required int currentIndex, required Function(int a) onTap });
final NestedNavigatorBarBuilder _defaultNavigationBarBuilder = ({ required currentIndex, required items, required onTap }) {
  return BottomNavigationBar(
    items: items,
    currentIndex: currentIndex,
    onTap: onTap,
  );
};

typedef NestedScaffoldBuilder = Scaffold Function({ required BottomNavigationBar navigationBar, required Widget body });
final NestedScaffoldBuilder _defaultScaffoldBuilder = ({ required body, required navigationBar}) {
  return Scaffold(
    body: body,
    bottomNavigationBar: navigationBar,
  );
};

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs a [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.body,
    required this.tabs,
    this.buildNavigationBar,
    this.buildScaffold,
    Key? key,
  }): super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// Body, i.e. the index stack
  final Widget body;

  /// List of tab objects to use in [BottomNavigationBar]
  final List<NestedNavigationTabItem> tabs;

  /// [BottomNavigationBar] builder
  final NestedNavigatorBarBuilder? buildNavigationBar;

  /// [Scaffold] builder
  final NestedScaffoldBuilder? buildScaffold;

  @override
  Widget build(BuildContext context) {
    final StatefulShellRouteState shellState =
        StatefulShellRouteState.of(context);

    final navigatorBar = (buildNavigationBar ?? _defaultNavigationBarBuilder)(
      currentIndex: shellState.currentIndex,
      items: tabs.map((tab) => BottomNavigationBarItem(
        icon: Icon(tab.icon),
        label: tab.name,
      )).toList(),
      onTap: (int tappedIndex) => shellState.goBranch(index: tappedIndex),
    );

    final scaffold = (buildScaffold ?? _defaultScaffoldBuilder)(
      body: body,
      navigationBar: navigatorBar,
    );

    return scaffold;
  }
}