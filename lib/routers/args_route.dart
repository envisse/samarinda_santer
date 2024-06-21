import 'package:flutter/material.dart';
import 'package:samarinda_santer/views/screens/home/screen.dart';
import 'package:samarinda_santer/views/screens/login/screen.dart';
import 'package:samarinda_santer/views/screens/not_found/screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case ('/login'):
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
    }
  }
}
