class Items {
  final String id;
  final String title;
  final String image;
  final String numberList;
  final String price;
  final String size;
  final String que;
  Items(
      {required this.numberList,
      required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.que,
      required this.size});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      numberList: json['numberList'],
      price: json['price'],
      que: json['que'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'numberList': numberList,
      };
}
