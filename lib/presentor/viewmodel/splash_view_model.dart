import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel {
  AppRepository _repository;

  SplashViewModel(this._repository);

  Future<bool> isUserLoggedIn() => _repository
      .getToken()
      .then((value) => ((value == null) == false))
      .catchError((error) => false);
}
