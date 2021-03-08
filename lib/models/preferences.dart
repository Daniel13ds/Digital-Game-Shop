import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();
  static final tokenkey = "token";
  SharedPreferences _preferences;
  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  set token(String token) {
    _preferences.setString(tokenkey, token);
  }

get token {
    return _preferences.getString(tokenkey);
  }
}
