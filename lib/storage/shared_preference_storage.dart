import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage {
  //singleton class
  SharedPreferenceStorage._();

  static final SharedPreferenceStorage _instance = SharedPreferenceStorage._();
  static SharedPreferenceStorage get instance => _instance;

  static SharedPreferences? prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //token
  static const _token = "token";
  // getter  and setter for token
  static String? get getToken => prefs?.getString(_token);
  // String? getToken() {
  //   return prefs?.getString(_token);
  // }
  static setToken(String? value) {
    prefs?.setString(_token, value ?? '');
  }

  static removeToken() async {
    await prefs?.remove(_token);
  }
}
