import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_tab_routes.dart';

class NestedNavigationTabItem {
  NestedNavigationTabItem({
    required String defaultLocation,
    required this.name,
    required this.icon,
    required this.body,
  }):
    branch = StatefulShellBranch(
      routes: [
        GoRoute(
          path: defaultLocation,
          builder: (_, __) => body,
          routes: (body is NestedNavigationTabRoutes ? body.routes : const []),
        ),
      ],
      defaultLocation: defaultLocation,
      name: name,
    );

  final String name;

  final IconData icon;

  final Widget body;

  final StatefulShellBranch branch;
}
