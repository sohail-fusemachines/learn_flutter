part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationLoading extends AuthenticationState {}
class AuthenticationLoggedIn extends AuthenticationState {}
class AuthenticationError extends AuthenticationState {
  final String _message;
  String get message => _message;
  AuthenticationError(this._message);
}
class AuthenticationLoggedOut extends AuthenticationState {}