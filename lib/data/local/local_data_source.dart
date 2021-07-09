
import 'package:fusemachines_app_1/data/local/prefs/prefs_helper.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource{
  String? getToken();
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
  String? getToken() {
    return _prefsHelper.token;
  }

  @override
  void setToken(String? token) {
    if(token != null){
      _prefsHelper.token = token;
    }

  }
}