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
  // getter  and setter for token
  static String? get getToken => prefs?.getString('token');
  // String? getToken() {
  //   return prefs?.getString('token');
  // }
  static setToken(String? value) {
    prefs?.setString('token', value ?? '');
  }
}
