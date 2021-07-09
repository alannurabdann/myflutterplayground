import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/MainPageController.dart';
import 'package:flutter_app/page/CartPage.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_app/page/OrderPage.dart';
import 'package:flutter_app/page/ProfilePage.dart';
import 'package:flutter_app/page/WishlistPage.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final MainPageController mainPageController =
      Get.put(MainPageController(), permanent: false);

  final BottomNavigationBarItem itemCartWithBadge = new BottomNavigationBarItem(
    icon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: Stack(children: <Widget>[
        new Icon(
          CupertinoIcons.shopping_cart,
          size: 20.0,
        ),
        new Positioned(
          // draw a red marble
          top: 0.0,
          right: 0.0,
          child:
              new Icon(Icons.brightness_1, size: 10.0, color: Colors.redAccent),
        )
      ]),
    ),
    label: 'Keranjang',
  );

  final BottomNavigationBarItem itemCart = new BottomNavigationBarItem(
    icon: new Icon(
      CupertinoIcons.shopping_cart,
      size: 20.0,
    ),
    activeIcon: new Icon(
      CupertinoIcons.cart_fill,
      size: 20.0,
    ),
    label: 'Keranjang',
  );

  final BottomNavigationBarItem itemHome = new BottomNavigationBarItem(
    icon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.house,
        size: 20.0,
      ),
    ),
    activeIcon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.house_fill,
        size: 20.0,
      ),
    ),
    label: 'INDOGROSIR',
  );

  final BottomNavigationBarItem itemWishlist = new BottomNavigationBarItem(
    icon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.heart,
        size: 20.0,
      ),
    ),
    activeIcon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.heart_fill,
        size: 20.0,
      ),
    ),
    label: 'INDOGROSIR',
  );

  final BottomNavigationBarItem itemOrder = new BottomNavigationBarItem(
    icon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.square_list,
        size: 20.0,
      ),
    ),
    activeIcon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.square_list_fill,
        size: 20.0,
      ),
    ),
    label: 'INDOGROSIR',
  );

  final BottomNavigationBarItem itemAccount = new BottomNavigationBarItem(
    icon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.person,
        size: 20.0,
      ),
    ),
    activeIcon: Container(
      margin: EdgeInsets.only(bottom: 3.0),
      child: const Icon(
        CupertinoIcons.person_fill,
        size: 20.0,
      ),
    ),
    label: 'INDOGROSIR',
  );

  createBottomNavigation() {
    return Obx(() => BottomNavigationBar(
          currentIndex: mainPageController.tabIndex.value,
          onTap: (index) => mainPageController.changeTabIndex(index),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            itemHome,
            itemWishlist,
            itemCart,
            itemOrder,
            itemAccount,
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: createBottomNavigation(),
      body: Obx(() => IndexedStack(
            index: mainPageController.tabIndex.value,
            children: [
              HomePage(),
              WishlistPage(),
              CartPage(),
              OrderPage(),
              ProfilePage(),
            ],
          )),
    ));
  }
}
