import 'package:flutter_app/controller/ControllersName.dart';
import 'package:flutter_app/controller/MainPageController.dart';
import 'package:get/get.dart';

class HomePageDependecy extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController(),
        fenix: true, tag: ControllersName.HomePageController);
  }
}
