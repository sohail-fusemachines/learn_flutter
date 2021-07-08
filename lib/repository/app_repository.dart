import 'package:fusemachines_app_1/data/local/local_data_source.dart';
import 'package:fusemachines_app_1/data/remote/remote_data_source.dart';
import 'package:fusemachines_app_1/model/login_response.dart';
import 'package:fusemachines_app_1/model/user_list_api_response.dart';
import 'package:injectable/injectable.dart';

abstract class AppRepository {
  Future<UserListApiResponse> getListOfUsers(double pageNumber);

  Future<LoginResponse> login(String email, String password);

  void clearPreferences();

  Future<String?> getToken();
}

@Injectable(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  AppRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<UserListApiResponse> getListOfUsers(double pageNumber) =>
      _remoteDataSource.getListOfUsers(pageNumber);

  @override
  Future<LoginResponse> login(String email, String password) =>
      _remoteDataSource.login(email, password).then((value) {
        _localDataSource.setToken(value.token);
        return value;
      });



  @override
  void clearPreferences(){
    _localDataSource.clearPreferences();
  }

  @override
  Future<String?> getToken() {
  return _localDataSource.getToken();
  }

}
