import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TOKEN = "token";

abstract class PeferencesHelper {
   Future<String?> getToken();
   void setToken(String? token);
    void clear();
}

@Injectable(as: PeferencesHelper)
class PeferencesHelperImpl extends PeferencesHelper {
  // Future<SharedPreferences> _preferences = getIt.getAsync<SharedPreferences>();
  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();


  // PeferencesHelperImpl(this._preferences);

  @override
  void setToken(String? token){
    if(token != null){
      _preferences.then((prefs)=> prefs.setString(TOKEN, token));
    }

  }

  @override
  void clear() {
    _preferences.then((value) => value.clear());
  }

  @override
  Future<String?> getToken() {
   return _preferences.then((prefs) =>  prefs.getString(TOKEN));
  }
}
