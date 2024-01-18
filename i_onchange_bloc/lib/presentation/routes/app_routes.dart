import '../../presentation/screens/settings_screen.dart';

import '../../logic/cubit/counter_cubit_cubit.dart';
import '../../presentation/screens/home_screen_1.dart';
import '../../presentation/screens/screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/screen_2.dart';

class AppRoutes {
  Route<dynamic>? onGeneratedRoute(RouteSettings routesSettings) {
    switch (routesSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen1(),
        );

      case '/screen2':
        return MaterialPageRoute(
          builder: (_) => HomeScreen2(),
        );

      case '/screen3':
        return MaterialPageRoute(
          builder: (_) => HomeScreen3(),
        );

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (ctx) => HomeScreen1(),
        );
    }
  }
}
