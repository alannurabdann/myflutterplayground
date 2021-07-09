import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screen/MainScreen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var textPasswordController = TextEditingController().obs;
  var textEmailController = TextEditingController().obs;
  var flagVisiblePassword = false.obs;

  void doLoginSequence() {
    if (textEmailController.value.text == "123" &&
        textPasswordController.value.text == "123") {
      Get.off(MainScreen());
    } else {
      Get.snackbar(
        "Error",
        "Kombinasi gagal",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void showVisiblePassword(){
    flagVisiblePassword.toggle();
  }
}
