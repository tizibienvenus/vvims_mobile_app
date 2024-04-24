import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  final SharedPreferences prefs;

  StorageServices(this.prefs);

  int? get userId => prefs.getInt('userId');
  bool get isFirstTime => prefs.getBool('isFirstTime') ?? true ;

  void saveData(String key, dynamic value) {
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
  }

  dynamic readData(String key) {
    final dynamic obj = prefs.get(key);
    return obj;
  }

  Future<bool> deleteData(String key) async {
    return prefs.remove(key);
  }

  Future<void> logout() async {
    prefs.setBool("isLoggedIn", false);
    prefs.setString('token', '');
    prefs.setString('user', '');
  }

  void removeUser() async {
    prefs.remove("user");
    prefs.remove("token");
    prefs.setBool("isLoggedIn", false);
  }
}
