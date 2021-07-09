import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/CakeController.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CakeController cakeController = Get.put(CakeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        automaticallyImplyLeading: false,
      ),
      body: new RefreshIndicator(
        onRefresh: () async { cakeController.fetchCake(1); },
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  controller: this.cakeController.scrollController.value,
                  itemCount: cakeController.listCake.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return Container(
                      child:
                          Image.network(cakeController.listCake[index].imgurl!),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
