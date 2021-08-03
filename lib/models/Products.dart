class Products {
  final String description, urlImage, priceNormal, priceDiscount, units;

  Products(this.description, this.urlImage, this.priceNormal,
      this.priceDiscount, this.units);


  @override
  String toString() {
    //return 'Products{name: $description, img: $urlImage, 'priceNormal: $priceNormal, priceDsc: $priceDiscount, units: $units}';

    return 'Products{name: $description}';
  }
}
