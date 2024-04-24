import 'dart:convert';
import 'package:vvims/config/app_colors.dart';
import 'package:vvims/utils/utils.dart';

class NetworkErrors {
  static void handleNetworkErrors(response) {
    final result = json.decode(response.body);
    if (response.statusCode == 404) {
      Utils.showToast(AppColors.red, result['message'] ?? 'Account not found, please create an account');
    } else if (response.statusCode == 400) {
      Utils.showToast(AppColors.red, result['message'] ?? 'Please provide all fields');
    }
    else {
      Utils.showToast(AppColors.red, 'Something happened, try again');
    }
  }

  static handleRequestErrors(message){
    final error = json.decode(message);
    Utils.showToast(AppColors.red, error ?? 'Something went wrong');
  }
}