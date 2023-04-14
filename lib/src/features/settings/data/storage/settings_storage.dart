import 'package:shared_preferences/shared_preferences.dart';

class SettingsStorage {
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
