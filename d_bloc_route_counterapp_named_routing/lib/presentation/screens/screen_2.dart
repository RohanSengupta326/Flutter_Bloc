// BLOC ROUTE ACCESS CONCEPT ON PREVIOUS SIMILAR COUNTERAPP.

import '../../logic/cubit/counter_cubit_cubit.dart';
import 'screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color color = Colors.red;
    return Scaffold(
      appBar: AppBar(backgroundColor: color),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: color,
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
                  backgroundColor: color,
                  onPressed: () => context.read<CounterCubit>().decr(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            MaterialButton(
              color: Colors.red,
              child: Text(
                'go to 3rd page',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/screen3'),
            )
          ],
        ),
      ),
    );
  }
}
