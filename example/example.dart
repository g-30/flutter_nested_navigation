import 'package:flutter/material.dart';
import 'package:flutter_nested_navigation/flutter_nested_navigation.dart';

void main() {
  runApp(NestedNavigationApp());
}

class NestedNavigationApp extends StatelessWidget {
  NestedNavigationApp({ super.key });

  final router = createNestedRouter(tabs: [
    NestedNavigationTabItem(
      defaultLocation: '/a',
      name: 'Page A',
      icon: Icons.home,
      body: ExamplePage(name: 'Page A', detailsPath: '/a/details'),
    ),
    NestedNavigationTabItem(
      defaultLocation: '/b',
      name: 'Page B',
      icon: Icons.home,
      body: ExamplePage(name: 'Page B', detailsPath: '/b/details'),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class ExamplePage extends StatelessWidget with NestedNavigationTabRoutes {
  ExamplePage({ super.key, required this.name, required this.detailsPath });

  final String name;

  final String detailsPath;

  @override
  final routes = [
    GoRoute(
      path: 'details',
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: const Text('Details Page')),
        body: Center(
          child: Text('Details ${state.location}'),
        )
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          
          Text(name),
          TextButton(
            onPressed: () => GoRouter.of(context).go(detailsPath),
            child: const Text('Go to details'),
          ),

        ]),
      ),
    );
  }
}
