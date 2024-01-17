import 'dart:async';

import '../../enum/connectivity_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_cubit_state.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  // here initializing with loading state.
  // listening to connectivity , if changes we update the internetcubitstate.

  // here we are listening to a stream and emitting new state accordingly, this also could have been :
  // pressing a button on UI and we come here and we call necessary functions like  : fetchProject.
  // then change emitNewState and reflect on UI with Blockbuilder or BlocConsumer.
  InternetCubit() : super(InternetLoading()) {
    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi) {
          internetConnected(ConnectivityType.wifi);
        } else if (connectivityResult == ConnectivityResult.mobile) {
          internetConnected(ConnectivityType.mobile);
        } else if (connectivityResult == ConnectivityResult.none) {
          internetDisconnected();
        }
      },
    );
  }

  void internetConnected(ConnectivityType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void internetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription.cancel();
    return super.close();
  }
}
