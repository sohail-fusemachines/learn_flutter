import 'package:bloc/bloc.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AppRepository _repository;
  AuthenticationCubit(this._repository) : super(AuthenticationInitial());

  void handleUserLoggedIn() async{
    await Future.delayed(Duration(seconds: 3));
   final token =  _repository.getToken();
   if(token != null && token != ""){
     emit(AuthenticationLoggedIn());
   } else {
     emit(AuthenticationLoggedOut());
   }
  }

  void login(String email, String password) {
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

  void logOut(){
    _repository.clearPreferences();
    emit(AuthenticationLoggedOut());
  }

}
