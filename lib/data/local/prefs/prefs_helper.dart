import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TOKEN = "token";

abstract class PeferencesHelper {
  abstract String? token;

  void clear();
}

@Singleton(as: PeferencesHelper)
class PeferencesHelperImpl extends PeferencesHelper {
  late SharedPreferences _preferences;

  PeferencesHelperImpl(this._preferences);

  @override
  String? get token => _preferences.containsKey(TOKEN) ? _preferences.getString(TOKEN) : "";

  set token(String? token) => _preferences.setString(TOKEN, token ?? "");

  @override
  void clear() {
    _preferences.clear();
  }
}
