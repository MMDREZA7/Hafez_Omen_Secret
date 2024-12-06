part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class RegisterUser extends AuthenticationEvent {
  final UserRegisterLoginDTO user;

  RegisterUser({
    required this.user,
  });
}

class LoginUser extends AuthenticationEvent {
  final UserRegisterLoginDTO user;

  LoginUser({
    required this.user,
  });
}
