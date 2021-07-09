import 'package:flutter/material.dart';
import 'package:flutter_app/controller/AuthController.dart';
import 'package:flutter_app/providers/RequestHandler.dart';
import 'package:flutter_app/screen/SplashScreen.dart';
import 'package:get/get.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  AuthController authController = Get.put(AuthController(), permanent: true);
  RequestHandler requestHandler = Get.put(RequestHandler(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        //todo : definisikan semua routing halaman
      ],
      initialRoute: "/",
    );
  }
}
