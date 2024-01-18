part of 'settings_cubit.dart';

// Dart compares two objects based on their memory address , not values or class name.
// so MyClass(value : 1)
// MyClass(value : 1)
// these are different to dart cause diff obj so diff memory address.

// we can override it, with equatable package, equatable tells dart, to compare two objects based on
// class name and values. then
// MyClass(value : 1)
// MyClass (value : 1)
// dart says its same. because same class and same value.

// but with Equatable we need to mention props to mention that : what values to check to compare two objects.

// Here Equatable is not needed, cause we already emit new states everytime.
// and bloc rule is so. we shouldnt edit existing instances/states.

class SettingsCubitState /* extends Equatable  */ {
  final bool appNotifications;
  final bool emailNotifications;

  SettingsCubitState(
      {required this.appNotifications, required this.emailNotifications});

  // copyWith : it creates a new instance of the class, if new constructor value is provided then it changes it,
  // else it copies with the previously existing constructor value.

  // ex : when we change the switch of appNotifications only, but not the emailNotifications on the UI, then
  // if we have emitted a new instance of this class, then we would have sent new value of appNotification
  // in the constructor, but emailNotification we would sent null, so we would loose the previously set value
  // of the emailNotification . and vice versa.

  // so in copyWith, if emailNotification is recieved as null, it copies the previous existed value of
  // puts it in using this.emailNotifications. so we dont loose the previous value of another argument while
  // setting a new one's.
  SettingsCubitState copyWith(
      {bool? appNotifications, bool? emailNotifications}) {
    return SettingsCubitState(
        appNotifications: appNotifications ?? this.appNotifications,
        emailNotifications: emailNotifications ?? this.emailNotifications);
  }

  /* @override
  // TODO: implement props
  List<Object?> get props => [appNotifications, emailNotifications]; */
}
