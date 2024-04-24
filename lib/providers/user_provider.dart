import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../network/network.dart';
import '../network/network_utils.dart';
import '../utils/session.dart';

class UserProvider extends ChangeNotifier {
  // User? _user;
  String? _token;
  bool _isFetchingUser = false;

  // User? get user => _user;
  String? get token => _token;
  bool get isFetchingUser => _isFetchingUser;

  Future<dynamic> getUser() async {
    const url = 'user/get-user';

    _isFetchingUser = true;
    notifyListeners();
    try {
      final hasNetwork = await NetworkUtils.hasNetwork();
      final response = hasNetwork ? await Network.get(url) : null;
      if (hasNetwork && response != null && response['status'] == true) {
        final user = response['user'];
        // _user = User.fromMap(user);
      } else {
        // _user = User.fromMap(user);
      }

      _isFetchingUser = false;
      notifyListeners();
      return true;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      _isFetchingUser = false;
      notifyListeners();
      return false;
    }
  }

  Future<dynamic> login(Map<String, dynamic> userData) async {
    const url = 'auth/login';
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(userData));
      if (response['status'] == true) {
        _token = response['token'];
        // _user = User.fromMap(response['user']);
        await SessionManager().setToken(_token!);
        await SessionManager().setLogin(true);
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return false;
    }
  }

  Future<dynamic> register(Map<String, dynamic> userData) async {
    const url = 'auth/register';
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(userData));
      if (response['status'] == true) {
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return false;
    }
  }

  Future<dynamic> registerWithPhone(Map<String, dynamic> userData) async {
    const url = 'auth/register';
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(userData));

      if (response['status'] == true) {
        _token = response['token'];
        // _user = User.fromMap(response['user']);
        await SessionManager().setToken(_token!);
        await SessionManager().setLogin(true);
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return false;
    }
  }

  Future<dynamic> resetPassword(Map<String, dynamic> userData) async {
    const url = 'auth/reset-password';
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(userData));
      if (response['status'] == true) {
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return false;
    }
  }

  Future<dynamic> changePassword(Map<String, dynamic> userData) async {
    const url = 'user/change-password';
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(userData));
      if (response['status'] == true) {
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return false;
    }
  }

  logout() {
    SessionManager ss = SessionManager();
    ss.logout();
    ss.removeUser();
  }
}
