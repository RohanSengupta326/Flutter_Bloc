import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enum/connectivity_type.dart';
import 'internet_cubit.dart';

part 'counter_cubit_state.dart';

// like the provider file where login, fetch/add product functions stays.
class CounterCubit extends Cubit<CounterCubitState> {
  final InternetCubit internetCubit;
  late StreamSubscription streamSubscription;

// recieiving InternetCubit instance, not new just existing one, to liste to its state.
  CounterCubit({required this.internetCubit})
      : super(CounterCubitState(counterValue: 0)) {
    // listening to the stream of changes of InternetCubit, to know what internet connection it is now.
    // and based on that call incr or decr function.
    streamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectivityType.wifi) {
        incr();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectivityType.mobile) {
        decr();
      }
    });
  }
  // here instead of listening to InternetCubitStream like this above, we also could have listened to it
  // with BlocListener on the UI, and based on changes could have called necessary functions from 
  // CounterCubit. ( check the commented code in HomeScreen1 )

  void incr() => emit(CounterCubitState(
      counterValue: state.counterValue + 1, isIncremented: true));

  void decr() => emit(CounterCubitState(
      counterValue: state.counterValue - 1, isIncremented: false));

  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription.cancel();
    return super.close();
  }
}
