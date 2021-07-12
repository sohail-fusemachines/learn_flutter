import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel {
  AppRepository _repository;

  SplashViewModel(this._repository);

  bool isUserLoggedIn() {
    final token = _repository.getToken();
    if(token == null || token == ""){
      return false;
    }
    return true;
  }
  

}
