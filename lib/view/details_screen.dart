import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/model/product_model.dart';
import 'package:e_commerce_getx/view/widgets/custom_button.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  DetailsScreen({required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 270,
            child: Image.network(
              productModel.image!,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: double.infinity, height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(text: productModel.name, size: 24),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              CustomText(
                                text: 'Size',
                              ),
                              SizedBox(width: 30),
                              CustomText(
                                text: productModel.size,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              CustomText(
                                text: 'Color',
                              ),
                              SizedBox(width: 30),
                              Container(
                                width: 40,
                                height: 20,
                                color: productModel.color,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    CustomText(text: 'Details', size: 18),
                    SizedBox(height: 20),
                    CustomText(
                        text: productModel.description, size: 18, height: 2),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(text: 'Price', size: 18),
                    SizedBox(height: 8),
                    CustomText(
                      text: '\$' + productModel.price!,
                      color: primaryColor,
                    ),
                  ],
                ),
                Container(
                  width: 150,
                  child: CustomButton(
                    child: CustomText(
                      text: 'Add',
                      color: Colors.white,
                      alignment: Alignment.center,
                    ),
                    onTap: () {},
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
