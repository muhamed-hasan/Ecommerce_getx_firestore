import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_getx/core/service/home_service.dart';
import 'package:e_commerce_getx/model/category_model.dart';
import 'package:e_commerce_getx/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getBestSelling();
  }
  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (var i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromMap(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  getBestSelling() async {
    _loading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (var i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromMap(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }
}
