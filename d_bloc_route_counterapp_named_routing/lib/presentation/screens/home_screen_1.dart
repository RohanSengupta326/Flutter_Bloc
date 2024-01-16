import '../../logic/cubit/counter_cubit_cubit.dart';
import '/presentation/screens/screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen1 extends StatelessWidget {
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
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'go to 2nd page',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/screen2'),
            )
          ],
        ),
      ),
    );
  }
}
