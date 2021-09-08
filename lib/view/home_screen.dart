import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/core/view_model/home_view_model.dart';
import 'package:e_commerce_getx/helper/binding.dart';
import 'package:e_commerce_getx/view/auth/login_screen.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final List<String> categories = [
    'Mohamed',
    'Mohamed',
    'Mohamed',
    'Mohamed',
    'Mohamed',
    'Mohamed',
    'Mohamed',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _bottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
    );
  }

  Widget _categoriesListView() {
    return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
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
                    child: Image.asset('assets/images/Icon_Mens Shoe.png')),
              ),
              SizedBox(height: 10),
              CustomText(text: categories[index]),
            ],
          );
        },
      ),
    );
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
    return Container(
      height: 350,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100),
                    width: 200,
                    height: 220,
                    child: Image.asset(
                      'assets/images/chaire.png',
                      fit: BoxFit.contain,
                    )),
                SizedBox(height: 10),
                CustomText(text: 'Speaker'),
                SizedBox(height: 10),
                CustomText(
                  text: 'Speaker description',
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                CustomText(
                  text: '\$100',
                  color: primaryColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
