import 'package:e_commerce_getx/model/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }
}
