import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._repository) : super(AuthenticationInitial());

  AppRepository _repository;


  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
        switch(event.runtimeType){
          case LoginEvent: {
            final loginEvent = event as LoginEvent;
            _login(loginEvent.userName , loginEvent.password );
            break;
          }
          case LogoutEvent: {
            _logOut();
            break;
          }
          case HandlePreviouslyLoggedIn: {
            _handleUserLoggedIn();
            break;
          }

        }

  }


  void _handleUserLoggedIn() async{
    await Future.delayed(Duration(seconds: 3));
    final token =  _repository.getToken();
    if(token != null && token != ""){
      emit(AuthenticationLoggedIn());
    } else {
      emit(AuthenticationLoggedOut());
    }
  }

  void _login(String email, String password) {
    emit(AuthenticationLoading());
    _repository.login(email, password).then((value)  {
      final token = value.token;
      if(token != null && token != ""){
        emit(AuthenticationLoggedIn());
      }

      final error = value.error;
      if(error != null && error != ""){
        emit(AuthenticationError(error));
      }

    });
  }

  void _logOut(){
    _repository.clearPreferences();
    emit(AuthenticationLoggedOut());
  }
}
