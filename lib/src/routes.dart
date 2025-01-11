import 'package:flutter/material.dart';
import 'package:lance/src/views/screens/screens.dart';

class LanceRoutes {
  static Map<String, WidgetBuilder> get defaultRoutes {
    return <String, WidgetBuilder>{
      SignupScreen.routeName: (context) => const SignupScreen(),
      DashboardScreen.routeName: (context) => DashboardScreen(),
    };
  }
}
