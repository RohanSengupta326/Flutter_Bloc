import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends HydratedCubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState(counterValue: 0));

  void incr() => emit(CounterCubitState(
      counterValue: state.counterValue + 1, isIncremented: true));

  void decr() => emit(CounterCubitState(
      counterValue: state.counterValue - 1, isIncremented: false));

  @override
  CounterCubitState? fromJson(Map<String, dynamic> json) {
    return CounterCubitState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterCubitState state) {
    //to send error to trigger onError.
    addError(Exception('couldnt write to storage'), StackTrace.current);
    return state.toMap();
  }

  // this method is called whenever there is a change in the state.
  // this change parameter contains current and next state data.
  // we can use this to debug and check state conditions by printing state changes as done below.
  @override
  void onChange(Change<CounterCubitState> change) {
    // TODO: implement onChange
    // print(
    //     'current state : ${change.currentState} , next State : ${change.nextState}');

    // or you can also directly print change.
    // normally dart cant print class instance data.
    // but we will have to override, toString functinos in CounterState class
    // to print the class data . ( don there )
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print(error);
    super.onError(error, stackTrace);
  }

  // in case of bloc theres : onEvent & onTransition
  // bloc listens to even stream, when cubit only listens to manual function call to change state.
  // onEvent triggers when there was a new even that occurred.and can print event.
  // onTransistion : triggers on event occurence & prints current next state & the even that causes it.

  // these are all like debugging methods, to observe states and events.
  // but have to override onchange and onevent functions to observe.
  // instead we can use BlocObserver to observe cubit & blocs all of them instead of manually overriding
  // onChange and onEvent functions for all cubit /blocs.

  // if using BlocObserver we dont need individual onChange, onErro in each cubit or bloc.
  // rather in a different file in logic from where it can watch all cubits/blocs.
  // and also have to initialize blocobserver in main.dart.
}
