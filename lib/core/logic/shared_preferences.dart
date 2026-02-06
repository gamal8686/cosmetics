import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void setIsNotFirst() {
    _preferences.setBool('isFirst', false);
  }

  static bool get getIsNotFirst {
    return _preferences.getBool('isFirst') ?? true;
  }

  Future<bool> logout() async {
    return _preferences.clear();
  }
}
