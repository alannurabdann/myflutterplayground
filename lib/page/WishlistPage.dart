import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/MainPageController.dart';
import 'package:get/get.dart';

class WishlistPage extends StatelessWidget{

  MainPageController controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text(
              "Main ${controller.authController.textEmailController.value.text} !!"),
          ElevatedButton(
            onPressed: () {
              controller.mainDialog("Wishlist", "Test Dialog", "Tutup", context);
            },
            child: Text("Show Dialog"),
          ),
          Obx(
                () => Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.listManusia.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => controller.showCustomSnackbar(
                        "Manusia",
                        controller.listManusia[index].nama + " $index",
                            () => controller.addItem()),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                controller.listManusia[index].nama + " $index"),
                          ),
                          Container(
                            child: Text(controller.listManusia[index].alamat),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => controller.addItem(),
            elevation: 2,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}