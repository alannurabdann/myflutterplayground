
import 'package:flutter_app/models/Products.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {

  var listProducts = List<Products>.from([]).obs;
  static final img1 = "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80";
  static final img2 = "https://klikigr.s3-ap-southeast-1.amazonaws.com/images/products/1363990.png";
  static final img3 = "https://images.tokopedia.net/img/cache/300-square/VqbcmM/2021/6/1/7e99dde5-da0d-46c3-9585-058d7814f3c4.jpg.webp?ect=4g";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addItem() {
    this.listProducts.add(new Products("AJINOMOTO TEPUNG BUMBU SAJIKU GOLDEN CRISPY PCK 200g LONG DESCRIPTION AND BLA BLA BLA",
        img3,
        "Rp 13.500", "0", "PCS"));

    update();
    // this.listManusia.assignAll([]);   clear -> insert bulk
  }

}