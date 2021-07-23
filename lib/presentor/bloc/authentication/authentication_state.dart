part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
    const factory AuthenticationState.initial() = _Initial;
    const factory AuthenticationState.loading() = _Loading;
    const factory AuthenticationState.loggedIn() = _LoggedIn;
    const factory AuthenticationState.error(String message) = _Error;
    const factory AuthenticationState.logOut() = _LogOut;
}
