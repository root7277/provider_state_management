import 'package:flutter/material.dart';
import 'package:provider_state_management/screens/one_screen.dart';
import 'package:provider_state_management/screens/tree_screen.dart';
import 'package:provider_state_management/screens/two_screen.dart';

class RoutesPage {
  Route getRoutes(RouteSettings routeSettings) {
    const String first = '/';
    const String second = '/two';
    const String third = '/tree';
    switch (routeSettings.name) {
      case first:
        return MaterialPageRoute(builder: (context) => const OneScreen());

      case second:
        return MaterialPageRoute(builder: (context) => const TwoScreen());

      case third:
        return MaterialPageRoute(builder: (context) => const TreeScreen());

      default:
        return MaterialPageRoute(builder: (context) => const OneScreen());
    }
  }
}
