import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/core/view_model/control_view_model.dart';
import 'package:e_commerce_getx/core/view_model/home_view_model.dart';
import 'package:e_commerce_getx/helper/binding.dart';
import 'package:e_commerce_getx/view/auth/login_screen.dart';
import 'package:e_commerce_getx/view/details_screen.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()), //fix initializing homeViewModel error
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchFormField(),
                      SizedBox(height: 40),
                      CustomText(text: 'Categories'),
                      SizedBox(height: 40),
                      _categoriesListView(),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            size: 18,
                          ),
                          CustomText(
                            text: 'See all',
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      _productListView()
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _categoriesListView() {
    return GetBuilder<HomeViewModel>(
        init: Get.find(),
        builder: (controller) {
          return controller.categoryModel.isEmpty
              ? CircularProgressIndicator()
              : Container(
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade100),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    controller.categoryModel[index].image!)),
                          ),
                          SizedBox(height: 10),
                          CustomText(
                              text: controller.categoryModel[index].name),
                        ],
                      );
                    },
                  ),
                );
        });
  }

  Widget _searchFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _productListView() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailsScreen(
                    productModel: controller.productModel[index]));
              },
              child: Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100),
                        width: 200,
                        height: 220,
                        child: Image.network(
                          controller.productModel[index].image!,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 10),
                    CustomText(text: controller.productModel[index].name),
                    SizedBox(height: 10),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '\$' + controller.productModel[index].price!,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
