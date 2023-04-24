import 'package:flutter/material.dart';
import 'package:task_e2/core/routes/route_strings.dart';
import 'package:task_e2/screens/pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initial:
        return routeName(const HomePage());
      default:
        return routeName(const HomePage());
    }
  }
}

MaterialPageRoute routeName(Widget route) {
  return MaterialPageRoute(builder: (_) => route);
}
