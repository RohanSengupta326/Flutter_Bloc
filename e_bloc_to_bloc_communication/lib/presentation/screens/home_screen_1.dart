import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/internet_cubit.dart';

import '../../enum/connectivity_type.dart';
import '../../logic/cubit/counter_cubit_cubit.dart';
import '/presentation/screens/screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bloc listener on widget tree top, cause it doesnt rebuild UI so can be used here
    // no worries of rebuilding huge widget tree.

    // Instead of building bloc to bloc communication by listening to one cubit state in another cubit
    // we can use BlocListener to listen to one cubit state and call functions to emit new state in another
    // cubit. like here InternetCubitstate is listened and functions are called in CounterCubit to emit
    // new state and then reflect on UI.
    return /* BlocListener<InternetCubit, InternetCubitState>(
      listener: (ctx, state) {
        // TODO: implement listener
        if (state is InternetConnected &&
            state.connectionType == ConnectivityType.wifi) {
          ctx.read<CounterCubit>().incr();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectivityType.mobile) {
          ctx.read<CounterCubit>().decr();
        }
      },
      child: */
        Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // listening to internetCubit so that based on wifi , mobile we can show that on UI too
            // not only update countercubit state.
            BlocBuilder<InternetCubit, InternetCubitState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectivityType.wifi) {
                  return Text(
                    'Wifi',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectivityType.mobile) {
                  return Text('Mobile Data',
                      style: TextStyle(fontSize: 20, color: Colors.purple));
                } else if (state is InternetDisconnected) {
                  return Text('Disconnected');
                } else
                  return CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 50,
            ),
            BlocConsumer<CounterCubit, CounterCubitState>(
              builder: (context, state) {
                return Text(state.counterValue.toString());
              },
              listener: (context, state) {
                if (state.isIncremented != null) {
                  if (state.isIncremented!) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Incremented')));
                  } else if (!state.isIncremented!) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Decremented')));
                  }
                }
              },
            ),
            // MaterialButton(
            //   color: Colors.blue,
            //   child: Text(
            //     'go to 2nd page',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () => Navigator.of(context).pushNamed('/screen2'),
            // )
          ],
        ),
      ),
      /*    ), */
    );
  }
}
