// BLOC to BLOC communication.
// based on internet connectivity type wifi or mobile data, we will increment & decrement counter respectively

// first we will set up a stream listener to listen to Connectivity package stream, that tells us
// internet is connected or not, and of what type in InternetCubit.

// then either we will use stream, and streamlistener in CounterCubit to listen to state changes in
// InternetCubitState or, BlocListener in root widget tree to listen to InternetCubitState and based on
// state we will call CounterCubit incr, decr function in listener.

import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/internet_cubit.dart';

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

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    // listening to multiple Blocs.
    // and providing globally. Global Access to all routes of the one instances of Internet and counter cubit.
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => InternetCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (ctx) =>
              // not new instance but existing instance sending of InternetCubit.
              CounterCubit(
                // remember to use the context inside create: , while sending an existing instance.
            internetCubit: ctx.read<InternetCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        // if using generated route ;
        onGenerateRoute: appRoutes.onGeneratedRoute,
      ),
    );
  }
}
