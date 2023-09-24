import 'package:flutter/material.dart';

import '../edit_profile/edit_profile.dart';
import '../login/login.dart';
import '../profile/profile.dart';
import '../signup/signup.dart';
import '../splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      // Add more routes here
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Route not found!'),
        ),
      );
    });
  }
}
