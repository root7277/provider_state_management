import 'package:flutter/material.dart';
import 'package:provider_state_management/screens/one_screen.dart';
import 'package:provider_state_management/screens/two_screen.dart';

class RoutesPage {
  Route getRoutes(RouteSettings routeSettings) {
    const String first = '/';
    const String second = '/two';
    switch (routeSettings.name) {
      case first:
        return MaterialPageRoute(builder: (context) => const OneScreen());

      case second:
        return MaterialPageRoute(builder: (context) => const TwoScreen());

      default:
        return MaterialPageRoute(builder: (context) => const OneScreen());
    }
  }
}
