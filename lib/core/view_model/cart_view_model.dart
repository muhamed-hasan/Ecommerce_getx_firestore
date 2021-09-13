import 'package:e_commerce_getx/core/service/database/cart_database_helper.dart';
import 'package:e_commerce_getx/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProducts = [];
  List<CartProductModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
  final dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProducts(); //!this calls the methods when instance created
  }
  getAllProducts() async {
    _loading.value = true;
    _cartProducts = await dbHelper.getAllProducts();

    _loading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel productModel) async {
    for (var product in _cartProducts) {
      if (product.id == productModel.id) {
        return;
      }
    }

    await dbHelper.insertProduct(productModel);
    _cartProducts.add(productModel);
    _totalPrice += double.parse(productModel.price!) * productModel.quantity!;
    update();
  }

  getTotalPrice() {
    for (var product in _cartProducts) {
      _totalPrice += double.parse(product.price!) * product.quantity!;

      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity = _cartProducts[index].quantity! + 1;
    _totalPrice += double.parse(_cartProducts[index].price!);
    await dbHelper.updateProduct(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity! <= 1) {
      await dbHelper.removeProduct(_cartProducts[index]);

      _cartProducts.removeAt(index);
    } else {
      _cartProducts[index].quantity = _cartProducts[index].quantity! - 1;
      _totalPrice -= double.parse(_cartProducts[index].price!);
      await dbHelper.updateProduct(_cartProducts[index]);
    }
    update();
  }
}
