import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vvims/config/app_colors.dart';

Future<XFile?> pickYourPic(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(
    source: ImageSource.camera,
    preferredCameraDevice: CameraDevice.front,
  );
  if (pickedFile != null) {
    return pickedFile;
  }
  return null;
}

showToast({required String message, required Color color}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

loading({Color? color, double? radius}) {
  return Center(
    child: SizedBox(
      width: 25,
      height: 25,
      child: CupertinoActivityIndicator(
        color: color ?? AppColors.green,
        radius: radius ?? 12.0,
      ),
    ),
  );
}

loadingProgress(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.grey.withOpacity(0.7),
      builder: (context) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
                  AppColors.black.withOpacity(1),
                  AppColors.black.withOpacity(0.3),
                ])),
            child: CupertinoActivityIndicator(
              color: AppColors.green,
              radius: 12,
            ),
          ),
        );
      });
}



// Future<bool> isConnectedToInternet() async {
//     final List<ConnectivityResult>> connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     } else {
//       return false;
//     }
//   }
