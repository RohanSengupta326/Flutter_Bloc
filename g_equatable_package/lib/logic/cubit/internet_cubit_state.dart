part of 'internet_cubit.dart';

sealed class InternetCubitState {}

final class InternetLoading extends InternetCubitState {}

final class InternetConnected extends InternetCubitState {
  final ConnectivityType connectionType;
  InternetConnected({required this.connectionType});
}

final class InternetDisconnected extends InternetCubitState {}
