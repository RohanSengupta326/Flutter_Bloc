import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/internet_cubit.dart';

import '../../enum/connectivity_type.dart';
import '../../logic/cubit/counter_cubit_cubit.dart';
import '/presentation/screens/screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Here instead of BlocBuilder we are using new Bloc updates, context.of<blocA>().watch().state
                // it works like a MultiBlocBuilder. simply put.
                // listens to multiple Bloc state changes and updates one UI.

                // using builder to start searching for BlocProvider context from a closest context of builder
                // widget, rather a far context.
                Builder(
                  builder: (BuildContext builderContext) {
                    final counterCubitState =
                        builderContext.watch<CounterCubit>().state;
                    final internetCubitState =
                        builderContext.watch<InternetCubit>().state;

                    if (internetCubitState is InternetConnected &&
                        internetCubitState.connectionType ==
                            ConnectivityType.wifi) {
                      return Text(
                        ' Connection Type :  Wifi \n Counter : ${counterCubitState.counterValue}',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      );
                    } else if (internetCubitState is InternetConnected &&
                        internetCubitState.connectionType ==
                            ConnectivityType.mobile) {
                      return Text(
                          ' Connection Type :  Mobile Data \n Counter : ${counterCubitState.counterValue}',
                          style: TextStyle(fontSize: 20, color: Colors.purple));
                    } else if (internetCubitState is InternetDisconnected) {
                      return Text(
                        ' Connection Type :  Disconnected , Counter : ${counterCubitState.counterValue}',
                      );
                    } else
                      return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            FloatingActionButton(
              // calling functions in CounterCubit just like Providr.of(context).callFunc();
              // context.read doesnt rebuild the widget.
              // so with the instance of Cubit we can call its functions.
              // & , we can send instance of existing Cubit to different route as we have done before :
              // when using BlocProvider.value ( value : context.read<type>();)
              onPressed: () => context.read<CounterCubit>().incr(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              // calling functions in CounterCubit just like Providr.of(context).callFunc();
              onPressed: () => context.read<CounterCubit>().decr(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),

            // instead of using :
            // BlockBuilder<a,b>(
            // buildWhen :
            // )

            // we can use context.select((){});
            // to rebuild widget only when particular state condition is met. not for all state changes.
            // select returns dynamically based on the funtion provided in it. here its boolean.
            // that is InternetDisconnected state or not.
            Builder(
              builder: (selectBuilderContext) {
                final internetDisconnected = selectBuilderContext.select(
                    (InternetCubit internetCubit) =>
                        internetCubit.state is InternetDisconnected);

                return Text(internetDisconnected ? 'Ooops! No internet' : '');
              },
            )
          ],
        ),
      ),
      /*    ), */
    );
  }
}
