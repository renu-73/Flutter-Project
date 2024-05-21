import 'package:flutter/material.dart';
import 'package:newz/controller/logincontoller.dart';
import 'package:newz/view/language.dart';

import 'package:get/get.dart';

class Login extends StatelessWidget {
  final _ctrl = Get.put(LoginController());
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 155, 141, 141),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100, left: 20),
              child: const Text(
                'Welcome',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: _ctrl.nameTextEditController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onChanged: (value) {
                        _ctrl.email.value = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          if (_ctrl.email.value == "") {
                            Get.snackbar("Alert", "Enter Username");
                            return;
                          }

                          Get.offAll(Language());
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
