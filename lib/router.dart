import 'package:flutter/material.dart';
import 'package:petshub/features/menu/screens/menu_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MenuScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MenuScreen(),
      );

    //

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
