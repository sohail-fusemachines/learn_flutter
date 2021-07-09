import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TOKEN = "token";

abstract class PeferencesHelper {
  abstract String? token;

  void clear();
}

@Injectable(as: PeferencesHelper)
class PeferencesHelperImpl extends PeferencesHelper {
  SharedPreferences _preferences;

  PeferencesHelperImpl(this._preferences);

  @override
  String? get token => _preferences.getString(TOKEN);

  set token(String? token) => _preferences.setString(TOKEN, token!);

  @override
  void clear() {
    _preferences.clear();
  }
}
