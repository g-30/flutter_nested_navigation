# Flutter Nested Stateful Navigation

Nested navigation package that allows having an individual stateful navigator for each tab of [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html).

The plugin enables Instagram-like User Experience i.e. new screens pushed in the tab navigators do not overlay the entire app view, allowing the user to browse inner routes of multiple tabs. Every tab uses its own [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html) with the help of [ShellRoute](https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html).

The package is based on [StatefulShellRoute proposition by tolo](https://github.com/flutter/packages/pull/2650).

## Getting started

To use this plugin, add `flutter_nested_navigation` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

## Usage

First, import `flutter_nested_navigation` and declare your tab widgets with the `NestedNavigationTabRoutes` mixin:
```dart

class ExampleTab extends StatelessWidget with NestedNavigationTabRoutes {

  @override
  final routes = [
    GoRoute(
      path: 'details',
      builder: (context, state) => SomeChildScreen(),
    ),
  ];

  ...
}
```

Next, create your router by calling `createNestedRouter`:
```dart
final router = createNestedRouter(tabs: [
  NestedNavigationTabItem(
    defaultLocation: '/a',
    name: 'Page A',
    icon: Icons.home,
    body: ExampleTab(name: 'Page A',
  ),
  NestedNavigationTabItem(
    defaultLocation: '/b',
    name: 'Page B',
    icon: Icons.home,
    body: ExampleTab(name: 'Page B'),
  ),
]);
```

And finally, use the created router e.g. by calling `MaterialApp.router(routerConfig: router)`.

See `example/example.dart` for more details.
