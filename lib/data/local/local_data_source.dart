
import 'package:fusemachines_app_1/data/local/prefs/prefs_helper.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource{
  Future<String?> getToken();
  void setToken(String? token);

  void clearPreferences();
}

@Singleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource{
  PeferencesHelper _prefsHelper;

  LocalDataSourceImpl(this._prefsHelper);




  @override
  void clearPreferences() {
   _prefsHelper.clear();
  }

  @override
  Future<String?> getToken() {
    return _prefsHelper.getToken();
  }

  @override
  void setToken(String? token) {
    _prefsHelper.setToken(token);
  }
}