import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin NestedNavigationTabRoutes on Widget {
  /// Override the routes for your tab in order to automatically add them to the navigator tree
  abstract final List<GoRoute> routes;
}
