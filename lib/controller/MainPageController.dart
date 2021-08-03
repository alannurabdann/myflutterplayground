import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/AuthController.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showCustomSnackbar(
      String title, String message, VoidCallback onPressedCallback) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      onTap: (_) => onPressedCallback(),
      backgroundColor: Colors.white,
      animationDuration: Duration(seconds: 3),
      backgroundGradient: LinearGradient(
          colors: [Colors.blue, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    );
  }

  void mainDialog(String _title, String _message, String _positiveButtonTitle,
      BuildContext _context) {
    showDialog(
      context: _context,
      builder: (_) => CupertinoAlertDialog(
        title: _title.trim().isEmpty ? null : Text(_title),
        content: _message.trim().isEmpty ? null : Text(_message),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            isDefaultAction: true,
            child: Text(_positiveButtonTitle),
          ),
        ],
      ),
    );
  }
}
