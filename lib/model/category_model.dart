import 'dart:convert';

class CategoryModel {
  String? name;
  String? image;
  CategoryModel({
    this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  CategoryModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
  }
}
