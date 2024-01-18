import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends HydratedCubit<CounterCubitState>  {
  CounterCubit() : super(CounterCubitState(counterValue: 0));

  void incr() => emit(CounterCubitState(
      counterValue: state.counterValue + 1, isIncremented: true));

  void decr() => emit(CounterCubitState(
      counterValue: state.counterValue - 1, isIncremented: false));

  // after refreshh hydratedbloc calls this fromJson to retrieve saved state data in Map format in local
  // storage.
  // that is also done by our auto built fromMap in state. that converts Map data and creates an object/state
  // instance , which means state change. which means UI rebuild and saved state data shown.
  @override
  CounterCubitState? fromJson(Map<String, dynamic> json) {
    return CounterCubitState.fromMap(json);
  }

  // whenver any state changes occur this function of HydratedMixin is called to store new state data
  // as Map in local storage. and we convert state data into Map with our state's toMap function which was
  // autobuilt.
  @override
  Map<String, dynamic>? toJson(CounterCubitState state) {
    return state.toMap();
  }
}
