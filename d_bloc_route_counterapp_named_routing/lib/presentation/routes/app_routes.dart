import 'package:bloc_route_access_counterapp_anonymus_routing/logic/cubit/counter_cubit_cubit.dart';
import 'package:bloc_route_access_counterapp_anonymus_routing/presentation/screens/home_screen_1.dart';
import 'package:bloc_route_access_counterapp_anonymus_routing/presentation/screens/screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/screen_2.dart';

class AppRoutes {
  final CounterCubit _counterCubit = CounterCubit();


  // though here I have to wrap every Screen with BlocProvider.value. 
  // if 100 screens are present that wouldn't be possible.
  // so rather we can wrap MaterialApp of main.dart file
  // while using onGeneratedRoute only to send context of BlocProvider globally
  // Global Access. 
  Route<dynamic>? onGeneratedRoute(RouteSettings routesSettings) {
    switch (routesSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: HomeScreen1(),
          ),
        );

      case '/screen2':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: HomeScreen2(),
          ),
        );

      case '/screen3':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: HomeScreen3(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: HomeScreen1(),
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
