part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.logIn(String userName, String password) = _LoginEvent;
  const factory AuthenticationEvent.logOut() = _LogOutEvent;
  const factory AuthenticationEvent.handlePreviouslyLoggedIn() = _HandlePreviouslyLoggedInEvent;
}

// class LoginEvent extends AuthenticationEvent{
//   final String _userName;
//   String get userName => _userName;
//
//   final String _password;
//   String get password => _password;
//
//   LoginEvent(this._userName, this._password);
// }
//
// class LogoutEvent extends AuthenticationEvent{}
// class HandlePreviouslyLoggedIn extends AuthenticationEvent{}
