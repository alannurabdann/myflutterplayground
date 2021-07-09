import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cake.dart';
import 'package:flutter_app/providers/RequestHandler.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CakeController extends GetxController {
  RequestHandler requestHandler = Get.find<RequestHandler>();
  var listCake = List<Cake>.from([]).obs;
  var currentPage = 1.obs;
  var scrollController = ScrollController().obs;
  var logger = new Logger();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.value = new ScrollController()
      ..addListener(() => listCakeListener());
    fetchCake(currentPage.value);
  }

  void listCakeListener() {
    logger.e("ExtentAfter" + this.scrollController.value.position.extentAfter.toString());
    if (this.scrollController.value.position.extentAfter < 10) {
      currentPage.value += 1;
      fetchCake(currentPage.value);
    }
  }

  Future fetchCake(int page) async {
    await requestHandler.getCake(page).then((value) {
      if (value != null) {
        this.listCake.addAll(value);
      }
    });
  }
}
