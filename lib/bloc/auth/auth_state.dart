part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Success extends AuthState {}

class Added extends AuthState {
  final dynamic result;
  Added(this.result);
}

class Failure extends AuthState {}