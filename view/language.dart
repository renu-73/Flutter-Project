import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newz/controller/homecontroller.dart';
import 'package:newz/view/homePage.dart';


class Language extends StatelessWidget {
  final _ctrl  = Get.put(HomeController());
   Language({super.key});

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
              'Select Language',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                 // top: MediaQuery.of(context).size.height * 0.5,
                top: Get.height * 0.5,
                  right: 35,
                  left: 35),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {

                        Get.to(HomePage(lanquage: 0,));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withAlpha(30),
                        ),
                       padding: EdgeInsets.symmetric(vertical: 10),
                       // padding: EdgeInsets.all(5),
                      //  margin: EdgeInsets.all(20),
                       // height: 50,
                       width: Get.width,
                       // width: 250,
                        child: Text(
                          "Hindi",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () {

                        Get.to(HomePage(lanquage: 1,));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withAlpha(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        // padding: EdgeInsets.all(5),
                        //  margin: EdgeInsets.all(20),
                        // height: 50,
                        width: Get.width,
                        // width: 250,
                        child: Text(
                          "English",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () {

                        Get.to(HomePage(lanquage: 2,));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withAlpha(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        // padding: EdgeInsets.all(5),
                        //  margin: EdgeInsets.all(20),
                        // height: 50,
                        width: Get.width,
                        // width: 250,
                        child: Text(
                          "Punjabi",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
