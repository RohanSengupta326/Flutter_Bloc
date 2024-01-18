// Hydrated bloc : observing app state.

import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/internet_cubit.dart';
import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/settings_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '/presentation/routes/app_routes.dart';

import './presentation/screens/home_screen_1.dart';

import './logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/screen_2.dart';
import 'presentation/screens/screen_3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hydrated bloc stores the state data in a Map format in local storage, when state changes
  // and then when app restarts brings up that data from local storage and maintains state.
  // it binds with native code to do that.

  // it used HydratedCubit<> instead of Cubit<> in countercubit calls toJson and fromJson functinos. 
  //explanation in counter
  // cubit.

  // if storageDirectory argument not specified it will store in local temporary location which can be
  // deleted by phoneOS at any time.
  // so rather we put it in specified documentary.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => InternetCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (ctx) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (ctx) => SettingsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRoutes.onGeneratedRoute,
      ),
    );
  }
}
