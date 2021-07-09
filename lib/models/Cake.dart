class Cake{
  String? id;
  String? rating;
  String? title, desc, imgurl;

  Cake({this.id, this.rating, this.title, this.desc, this.imgurl});

  factory Cake.fromJson(Map<String, dynamic> param){
    return Cake(
      id: param['id'].toString(),
      title: param['title'],
      desc: param['description'],
      rating: param['rating'].toString(),
      imgurl: param['image']
    );
  }

  @override
  String toString() {
    return 'Cake{id: $id, rating: $rating, title: $title, desc: $desc, imgurl: $imgurl}';
  }
}