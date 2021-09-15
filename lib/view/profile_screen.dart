import 'package:e_commerce_getx/core/view_model/profile_view_model.dart';
import 'package:e_commerce_getx/view/auth/login_screen.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) {
          return Scaffold(
            body: controller.userModel == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    padding: EdgeInsets.only(top: 50),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      radius: 50,
                                      child: controller.userModel == null
                                          ? Icon(
                                              Icons.person,
                                              size: 50,
                                            )
                                          : Image.network(
                                              controller.userModel!.pic!)),
                                  Column(
                                    children: [
                                      CustomText(
                                        text: controller.userModel!.name,
                                        color: Colors.black,
                                        size: 32,
                                      ),
                                      CustomText(
                                        text: controller.userModel!.email,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 100),
                            menuButton(
                              title: 'Edit Profile',
                              image: 'assets/images/edit.png',
                              onTap: () {},
                            ),
                            SizedBox(height: 10),
                            menuButton(
                              title: 'Shipping Address',
                              image: 'assets/images/location.png',
                              onTap: () {},
                            ),
                            SizedBox(height: 10),
                            menuButton(
                              title: 'Order History',
                              image: 'assets/images/history.png',
                              onTap: () {},
                            ),
                            SizedBox(height: 10),
                            menuButton(
                              title: 'Cards',
                              image: 'assets/images/payment.png',
                              onTap: () {},
                            ),
                            SizedBox(height: 10),
                            menuButton(
                              title: 'Notifications',
                              image: 'assets/images/notification.png',
                              onTap: () {},
                            ),
                            SizedBox(height: 10),
                            menuButton(
                              title: 'Logout',
                              image: 'assets/images/exit.png',
                              onTap: () {
                                controller.signOut();
                              },
                            ),
                          ]),
                    ),
                  ),
          );
        });
  }
}

class menuButton extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;

  const menuButton(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          onTap();
        },
        child: ListTile(
          title: CustomText(
            text: title,
          ),
          leading: Image.asset(image),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
