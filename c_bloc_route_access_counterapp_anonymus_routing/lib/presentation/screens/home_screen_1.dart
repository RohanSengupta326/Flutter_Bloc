import 'package:bloc_route_access_counterapp/cubit/counter_cubit_cubit.dart';
import 'package:bloc_route_access_counterapp/presentation/screens/screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  // calling functions in CounterCubit just like Providr.of(context).callFunc();
                  onPressed: () => context.read<CounterCubit>().incr(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                BlocConsumer<CounterCubit, CounterCubitState>(
                  builder: (context, state) {
                    return Text(state.counterValue.toString());
                  },
                  listener: (context, state) {
                    if (state.isIncremented != null) {
                      if (state.isIncremented!) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Incremented')));
                      } else if (!state.isIncremented!) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Decremented')));
                      }
                    }
                  },
                ),
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().decr(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),

            // going to second page, and will call fucntions from CounterCubit from 2nd page too, but it wont be able to identify which CounterCubit
            // because new context on second page.
            // so thats why BlocProvider<>.value() will be used to send the existing CounterCubit instance.

            // Anonymus Routing. ( without pagename )
            MaterialButton(
              color: Colors.blue,
              child: Text('go to 2nd page', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return BlocProvider<CounterCubit>.value(
                      // note : not a new instance of CounterCubit(), rather the already created instance above should be sent to new page.
                      value: BlocProvider.of<CounterCubit>(context),
                      child: HomeScreen2(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
