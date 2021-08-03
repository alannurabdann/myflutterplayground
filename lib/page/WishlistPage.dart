import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/MainPageController.dart';
import 'package:flutter_app/controller/WishlistController.dart';
import 'package:flutter_app/models/Products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class WishlistPage extends StatelessWidget {
  WishlistController wishlistController = Get.put(WishlistController());
  MainPageController controller = Get.put(MainPageController());

  void _onTileClicked(int index) {
    debugPrint("You tapped on item $index");
  }

  List<Widget> _getTiles(List<Products> mList) {
    final List<Widget> tiles = <Widget>[];
    for (int index = 0; index < mList.length; index++) {
      tiles.add(new GridTile(
          child: new InkResponse(
        enableFeedback: true,
        child: Container(
            color: Colors.black,
            height: 800,
            child: Column(children: [
              SvgPicture.asset(
                'assets/logo_klik_igr.svg',
                height: 36,
              ),
              ListTile(
                title: Text(wishlistController.listProducts[index].description
                    .toString()),
                subtitle: Text(
                  wishlistController.listProducts[index].priceNormal,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ])),
        onTap: () => _onTileClicked(index),
      )));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Main ${controller.authController.textEmailController.value.text} !!"),
          ElevatedButton(
            onPressed: () {
              controller.mainDialog(
                  "Wishlist", "Test Dialog", "Tutup", context);
            },
            child: Text("Show Dialog"),
          ),
          Obx(
            () => Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                itemCount: wishlistController.listProducts.length,
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                itemBuilder: (BuildContext context, int index) => new Container(
                    child: InkWell(
                        onTap: () => controller.showCustomSnackbar(
                            "Products",
                            wishlistController.listProducts[index].description +
                                " $index",
                            () => wishlistController.addItem()),
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                                margin: EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.0),
                                            topLeft: Radius.circular(8.0)),
                                        child: CachedNetworkImage(
                                          imageUrl: wishlistController
                                              .listProducts[index].urlImage,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        wishlistController
                                            .listProducts[index].description
                                            .toString(),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        wishlistController
                                            .listProducts[index].priceNormal
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                    ]))))),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => wishlistController.addItem(),
            elevation: 2,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
