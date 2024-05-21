import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newz/controller/homecontroller.dart';
import 'package:newz/model/modelChanneldata.dart';
import 'package:url_launcher/url_launcher.dart';

import 'channelList.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key, this.lanquage}) : super(key: key);
 // final  HomeController _homeCtrl  = Get.find();
   final _homeCtrl = Get.put(HomeController());
   final lanquage;

  @override
  Widget build(BuildContext context) {

    print("object ${_homeCtrl.channelDetails.value}");

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/1.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/3.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    //  height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),

              SizedBox(height: 20,),
              
              Align(
                alignment: Alignment.topLeft,
                child: Text("Channel list", style: TextStyle(
                  fontSize: 18,
                ),),
              ),
              SizedBox(height: 5,),

             Obx(()=>
                 GridView.builder(
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       crossAxisSpacing: 5,
                       mainAxisSpacing: 5,
                       // childAspectRatio:  2/2,
                     ) ,
                     itemCount: _homeCtrl.channelDetails.length >= 4 ? 4 : _homeCtrl.channelDetails.length,
                     itemBuilder: (BuildContext context ,int index ){
                       ModelChannelData  data = _homeCtrl.channelDetails[index];
                       print("length : ${_homeCtrl.channelDetails.length}");
                       return InkWell(
                         onTap: (){

                           launchUrl(
                               lanquage == 0
                               /// here hindi
                               ? Uri.parse(data.hindiUrl)
                               :lanquage == 1
                               /// here english
                               ?Uri.parse(data.englishUrl)
                               : lanquage == 2
                               /// here punjabi
                               ?Uri.parse(data.punjabiUrl)
                               /// here hindi
                               :Uri.parse(data.hindiUrl),
                               mode: LaunchMode.inAppWebView);
                         },
                         child: Card(
                           elevation: 10,
                           child: AspectRatio(
                               aspectRatio: 2/2,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(4),
                                 child: Image.network(

                                   lanquage == 0
                                   /// here hindi
                                       ? data.hindiLogo
                                       :lanquage == 1
                                   /// here english
                                       ?data.englishLogo
                                       :lanquage == 2
                                   /// here punjabi
                                       ?data.punjabiLogo
                                   /// here hindi
                                       :data.hindiLogo,


                                   fit: BoxFit.cover,),
                               )

                             //Image.network(data.image,fit: BoxFit.cover,),
                           ),
                         ),
                       );

                     }),
             ),
               SizedBox(height: 5,),
               InkWell(
                 onTap: (){
                   Get.to(ChannelList(lanquage: lanquage,));
                 },
                 child: Align(
                   alignment: Alignment.topRight,
                     child: Text("View all...", style: TextStyle(fontSize: 14, color: Colors.black45),)),
               )

            ],
          ),
        ),
      ),
    );
  }
}
