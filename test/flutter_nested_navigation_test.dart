import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_nested_navigation/flutter_nested_navigation.dart';

void main() {
  final tab = NestedNavigationTabItem(defaultLocation: '/test', name: 'Test', icon: Icons.home, body: TestTab());
    
  GoRouter? router;
  setUp(() {
    router = createNestedRouter(tabs: [
      tab,
    ]);
  });

  test('router is created', () {
    expect(router, isNotNull);
  });

  test('config routes and the branch routes match', () {
    expect(router!.routeConfiguration.routes[0].routes, tab.branch.routes);
  });

  test('first route is StatefulShellRoute', () {
    expect(router!.routeConfiguration.routes[0].runtimeType, StatefulShellRoute);
  });

  test('first branch is the same as the predefined NavigationTabItem\'s branch', () {
    final route = router!.routeConfiguration.routes[0] as StatefulShellRoute;
    expect(route.branches[0], tab.branch);
  });
}

class TestTab extends StatelessWidget implements NestedNavigationTabRoutes {
  TestTab({ super.key });

  @override
  final routes = [
    GoRoute(
      path: '/test',
      builder: (context, state) => Container(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
