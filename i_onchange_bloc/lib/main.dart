// onChange and onError  ..funcs in cubit.

import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/internet_cubit.dart';
import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/settings_cubit.dart';
import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/my_bloc_observer/my_bloc_observer.dart';
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
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // if wanna use blocObserver.
  // Bloc.observer = MyBlocObserver() ;

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
