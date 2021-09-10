import 'dart:convert';

import 'package:e_commerce_getx/helper/extenstion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? id;
  String? name;
  String? image;
  String? description;
  Color? color;
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
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
  }
}
