import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/controller/AuthController.dart';
import 'package:flutter_app/screen/MainScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  AuthController controller = Get.find<AuthController>();

  @override
  Widget build(context) {
    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
          title: Text(
            "Login",
            textAlign: TextAlign.left,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/logo_klik_igr.svg',
                        height: 40,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                              autofocus: true,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              controller: controller.textEmailController.value),
                          SizedBox(height: 8),
                          Obx(
                            () => TextField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        controller.flagVisiblePassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                    onPressed: () =>
                                        controller.showVisiblePassword(),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                autofocus: true,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:
                                    !controller.flagVisiblePassword.value,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                controller:
                                    controller.textPasswordController.value),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text('DAFTAR'),
                          onPressed: () {},
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text('LOGIN'),
                          onPressed: () {
                            controller.doLoginSequence();
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
