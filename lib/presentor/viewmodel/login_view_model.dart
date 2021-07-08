
import 'package:fusemachines_app_1/model/login_response.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel{
  AppRepository _appRepository;

  LoginViewModel(this._appRepository);

  Future<LoginResponse> login(String email, String password) => _appRepository.login(email, password);

}

