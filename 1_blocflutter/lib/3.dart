//bloc 1

import 'package:bloc/bloc.dart';

sealed class ChangeEvent {}

class IncrementPressed extends ChangeEvent {}

class BlocCounter extends Bloc<ChangeEvent, int> {
  BlocCounter() : super(0) {
    on<IncrementPressed>((event, emit) => emit(state + 1));
  }
}

Future<void> main() async {
  final bloc = BlocCounter();

  print(bloc.state);
  bloc.add(IncrementPressed());

  await Future.delayed(Duration(seconds: 2));
  print(bloc.state);

  bloc.close();
}
