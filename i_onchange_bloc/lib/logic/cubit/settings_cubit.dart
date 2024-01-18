import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_cubit_state.dart';

class SettingsCubit extends Cubit<SettingsCubitState> {
  SettingsCubit()
      : super(SettingsCubitState(
            appNotifications: false, emailNotifications: false));

  void toggleAppNotification(bool newValue) {
    //! never do this :

    /* state.appNotifications = newValue ;
    emit(state); */

    // +
    // changing values of already existing class instance, what would happen is :
    // dart compares objects using its memory address not values or based on same classname.
    // so when we update existing class instance with new value and emit that
    // because it doesnt care about value, and we updated existing class instances value, the memory address
    // is same. so dart thinks its the same object.
    // +
    // and bloc, dont emit new state if the state/object is same as before one after another.
    // so dart says its the same object, bloc wont emit it then.
    // so our UI won't update.

    //
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotification(bool newValue) {
    emit(state.copyWith(emailNotifications: newValue));
  }
}
