import 'package:digital_partnership_group/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get IsOnboarding => _sharedPrefs?.getBool(keyOnBoarding) ?? false;

  void setIsOnboarding(bool value) {
    _sharedPrefs?.setBool(keyOnBoarding, value);
  }

  bool get IsEnablePermissionLocation =>
      _sharedPrefs?.getBool(keyLocation) ?? false;

  void setIsEnablePermissionLocation(bool value) {
    _sharedPrefs?.setBool(keyLocation, value);
  }

  bool get IsAuth => _sharedPrefs?.getBool(keyAuth) ?? false;

  void setIsAuth(bool value) {
    _sharedPrefs?.setBool(keyAuth, value);
  }
}
