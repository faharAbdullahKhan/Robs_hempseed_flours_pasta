class Products {
  Products({
    required this.name,
    required this.image,
    required this.quantity
  });

  String name;
  String image;
  int quantity;

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "quantity" : quantity
  };
}