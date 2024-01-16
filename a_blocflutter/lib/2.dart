// cubit 2

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  //initialising with 0.

  void incr() => emit(state + 1);
  void decr() => emit(state - 1);

  // onChange is called only when incr,decr functions are called
  // not listenting to stream only when functions are called.
  // but returns stream of output though. like print changes stream.

  // but when using blocBuilder it automatically listens to changes and rebuild required UI
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(state);
  }
}

Future<void> main() async {
  final CounterCubit cubit = CounterCubit();

  cubit.incr();
  cubit.incr();
  cubit.incr();

  await Future.delayed(Duration(seconds: 2));
  await cubit.close();
}
