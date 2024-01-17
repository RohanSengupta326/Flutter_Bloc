import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enum/connectivity_type.dart';
import 'internet_cubit.dart';

part 'counter_cubit_state.dart';

// like the provider file where login, fetch/add product functions stays.
class CounterCubit extends Cubit<CounterCubitState> {
// recieiving InternetCubit instance, not new just existing one, to liste to its state.
  CounterCubit() : super(CounterCubitState(counterValue: 0));

  void incr() => emit(CounterCubitState(
      counterValue: state.counterValue + 1, isIncremented: true));

  void decr() => emit(CounterCubitState(
      counterValue: state.counterValue - 1, isIncremented: false));
}
