part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent{
  final String _userName;
  String get userName => _userName;

  final String _password;
  String get password => _password;

  LoginEvent(this._userName, this._password);
}

class LogoutEvent extends AuthenticationEvent{}
class HandlePreviouslyLoggedIn extends AuthenticationEvent{}
