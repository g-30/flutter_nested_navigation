import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_tab_item.dart';
import 'scaffold_with_navbar.dart';

GoRouter createNestedRouter({
  required List<NestedNavigationTabItem> tabs,
  NestedNavigatorBarBuilder? buildNavigationBar,
  NestedScaffoldBuilder? buildScaffold,
}) {
  final branches = tabs.map((tab) => tab.branch).toList();

  final router = GoRouter(
    initialLocation: branches[0].defaultLocation,
    routes: <RouteBase>[
      StatefulShellRoute(
        branches: branches,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(
            body: child,
            tabs: tabs,
            buildNavigationBar: buildNavigationBar,
            buildScaffold: buildScaffold,
          );
        },
      ),
    ],
  );

  return router;
}
