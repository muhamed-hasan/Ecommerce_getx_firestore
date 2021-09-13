import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/core/view_model/cart_view_model.dart';
import 'package:e_commerce_getx/view/widgets/custom_button.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.cartProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          child: Image.network(
                            controller.cartProducts[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.cartProducts[index].name,
                                size: 24,
                              ),
                              SizedBox(height: 10),
                              CustomText(
                                text: controller.cartProducts[index].price,
                                color: primaryColor,
                              ),
                              SizedBox(height: 20),
                              Container(
                                color: Colors.grey.shade200,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.increaseQuantity(index);
                                        },
                                        icon: Icon(Icons.add)),
                                    SizedBox(width: 20),
                                    CustomText(
                                        text: controller
                                            .cartProducts[index].quantity
                                            .toString()),
                                    SizedBox(width: 20),
                                    IconButton(
                                        onPressed: () {
                                          controller.decreaseQuantity(index);
                                        },
                                        icon: Icon(Icons.remove)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'TOTAL',
                          size: 22,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        CustomText(
                          text: '\$' + controller.totalPrice.toString(),
                          size: 18,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    Container(
                      width: 180,
                      height: 70,
                      child: CustomButton(
                        onTap: () {
                          //TODO
                        },
                        child: CustomText(
                          text: 'CHECK OUT',
                          alignment: Alignment.center,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
