class CartProductModel {
  String? id;
  String? name;
  String? image;
  int? quantity;
  String? price;

  CartProductModel({
    this.id,
    this.name,
    this.image,
    this.quantity,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': id,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }

  CartProductModel.fromMap(Map<String, dynamic> map) {
    id = map['productId'];
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }
}
