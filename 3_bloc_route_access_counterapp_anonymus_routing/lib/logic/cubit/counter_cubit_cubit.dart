import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_cubit_state.dart';

// like the provider file where login, fetch/add product functions stays. 
class CounterCubit extends Cubit<CounterCubitState> {
  // initializing with value, like empty _items list. 
  CounterCubit() : super(CounterCubitState(counterValue: 0));

  void incr() => emit(CounterCubitState(counterValue: state.counterValue + 1, isIncremented: true));
  // like signup/fetch/add product functions. 
  // just updating the _items in the func itself only, we update that here and send to CubitState to save that and then call that _items 
  // from CubitState in CubitBuilder. 
  // where in provide we put the _items getter in the provider functions file itself and call with provider.of(context).items. 
  void decr() => emit(CounterCubitState(counterValue: state.counterValue - 1, isIncremented: false));
}
