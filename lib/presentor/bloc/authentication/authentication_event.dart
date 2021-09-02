part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.logIn(String userName, String password) = _LoginEvent;
  const factory AuthenticationEvent.logOut() = _LogOutEvent;
  const factory AuthenticationEvent.handlePreviouslyLoggedIn() = _HandlePreviouslyLoggedInEvent;
}

