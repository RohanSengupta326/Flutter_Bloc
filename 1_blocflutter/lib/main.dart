// cubit 1

// Stream<int> streamF() async* {
//   for (int i = 0; i < 5; i++) {
//     print('####### PUTTING IN STREAM : ${i.toString()} #########\n');
//     await Future.delayed(Duration(seconds: 1));
//     yield i;
//   }
// }

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void incr() => emit(state + 1);
  void decr() => emit(state - 1);
}

void main() async {
  // Stream<int> listener = streamF();

  // listener.listen((event) {
  //   print('######## PRINTING LISTENED : ${event.toString()} ###########\n');
  // });

  final cubit = CounterCubit();

  print(cubit.state);
  cubit.incr();

  print(cubit.state);
  cubit.decr();


  print(cubit.state);
  cubit.incr();

  print(cubit.state);
  cubit.decr();

  print(cubit.state);
  cubit.incr();
}
