import 'dart:convert';

class ProductModel {
  String? id;
  String? name;
  String? image;
  String? description;
  String? color;
  String? size;
  String? price;
  ProductModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.color,
    this.size,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }

  ProductModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = map['color'];
    size = map['size'];
    price = map['price'];
  }
}
