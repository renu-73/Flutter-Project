import 'package:flutter/material.dart';
import 'package:newz/controller/logincontoller.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final _demoController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.jpeg'), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'NEWS',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
