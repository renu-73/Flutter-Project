import 'package:flutter/material.dart';
import 'package:newz/view/login.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  var passTextEditController = TextEditingController();
  var nameTextEditController = TextEditingController();

  var email = "".obs;
  // var password = "".obs;
  //oninit used to call
  @override
  void onInit() {
    super.onInit();

    Splash();
  }

  Splash() {
    Future.delayed(Duration(milliseconds: 5000), () {
      Get.off(Login());
    });
  }
}
