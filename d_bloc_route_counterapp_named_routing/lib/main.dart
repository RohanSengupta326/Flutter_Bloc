// BLOC ROUTE ACCESS CONCEPT ON PREVIOUS  COUNTERAPP.
// Named Routing & Generated Routing.

import '/presentation/routes/app_routes.dart';

import './presentation/screens/home_screen_1.dart';

import './logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/screen_2.dart';
import 'presentation/screens/screen_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // creating one instance and using that in all the routes by sending it with BlocProvider.value().
  // final CounterCubit counterCubit = CounterCubit();

  // else if using onGenerateRoute
  final AppRoutes appRoutes = AppRoutes();

  @override
  void dispose() {
    // TODO: implement dispose
    // counterCubit.close();

    // if using onGenerateRoute
    appRoutes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Named Routing.
      /*  routes: {
        '/': (context) => BlocProvider<CounterCubit>.value(
              value: counterCubit,
              child: HomeScreen1(),
            ),
        '/screen2': (context) => BlocProvider<CounterCubit>.value(
              value: counterCubit,
              child: HomeScreen2(),
            ),
        '/screen3': (context) => BlocProvider<CounterCubit>.value(
              value: counterCubit,
              child: HomeScreen3(),
            ),
      },
 */
      // if using generated route ;
      onGenerateRoute: appRoutes.onGeneratedRoute,
    );
  }
}
