import 'package:bloc_counterapp/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //BlocProvider like ChangeNotifierProvider to let bloc know someone in its child is depending on CounterCubit.
    // only when CounterCubit functions will be called then this connection will be established
    // can set that to do immediately by setting lazy : false.
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

// if not creating this page seperately blocprovider giving error. dont know why.
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bloclListener listens to changes in CuicState, but doesnt update UI, but called function in listener : , only once when state
      // changes in cubic state. so if something needs to be called when state but if called inside blockbuilder it will get called
      // multiple times, you dont want that, then call inside blocklistener.
      body: /* BlocListener<CounterCubit, CounterCubitState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isIncremented != null) {
            if (state.isIncremented!) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Incremented')));
            }else if (!state.isIncremented!) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Decremented')));
            }
          }
        },
        child: */
          Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              // calling functions in CounterCubit just like Providr.of(context).callFunc();
              onPressed: () => context.read<CounterCubit>().incr(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            // like consumer, this automatically listens to changes in called func in cubit & cubitState and rebuilds only child widget.
            // blockBuilder gets called multiple times, so something like routing inside builder function can cause multiple calling ..
            /* BlocBuilder<CounterCubit, CounterCubitState>(
                builder: (context, state) {
                  // state is the value like _items getter in case of provider. when that gets updated we update the UI to show updated list
                  return Text(state.counterValue.toString());
                },
              ), */
            // blockConsumer lets us use listener and builder both together , having its own respective functions as mentioned above.

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
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().decr(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
      // ), // blocklistener closing brace.
    );
  }
}
