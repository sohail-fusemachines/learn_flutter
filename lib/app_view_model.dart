
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppViewModel {

  AppRepository _repository;

  AppViewModel(this._repository);

  Future<bool> isUserLoggedIn() => _repository.getToken().then((token) {
    final isTokenNull = (token == null);
    if(isTokenNull == true){
      return false;
    }
    return true;
  });
}