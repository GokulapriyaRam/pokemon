import 'package:flutter/material.dart';
import 'package:task_e2/core/routes/route_strings.dart';
import 'package:task_e2/screens/home/pages/home.dart';
import 'package:task_e2/screens/home/pages/search_page.dart';
import 'package:task_e2/screens/home/pages/view_pokemon.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initial:
        return routeName(const HomePage());
      case AppRoutes.viewPokemon:
        return routeName(const ViewPokemon());
      case AppRoutes.searchPage:
        return routeName(const SearchPage());
      default:
        return routeName(const HomePage());
    }
  }
}

MaterialPageRoute routeName(Widget route) {
  return MaterialPageRoute(builder: (_) => route);
}
