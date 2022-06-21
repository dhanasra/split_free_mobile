part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignupEvent extends AuthEvent{
  final String emailId;
  final String password;
  final String phoneNumber;

  SignupEvent({
    required this.emailId,
    required this.password,
    required this.phoneNumber
  });
}

class LoginEvent extends AuthEvent{
  final String emailId;
  final String password;

  LoginEvent({
    required this.emailId,
    required this.password
  });
}

class AddUserDetailEvent extends AuthEvent{
  final String fullName;
  final String email;
  final String phone;
  final String registrationStatus;
  final SUPPORTED_LOCALE locale;

  AddUserDetailEvent({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.registrationStatus,
    required this.locale,
  });
}
