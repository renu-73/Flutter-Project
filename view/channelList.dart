import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/homecontroller.dart';
import '../model/modelChanneldata.dart';

class ChannelList extends StatelessWidget {
  ChannelList({Key? key, this.lanquage}) : super(key: key);
  final HomeController _homeCtrl = Get.find();
  final lanquage;

  @override
  Widget build(BuildContext context) {
    print("Lnquge Value :$lanquage");
    return Scaffold(
      appBar: AppBar(
        title: Text("Channel List"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                // childAspectRatio:  2/2,
              ),
              itemCount: _homeCtrl.channelDetails.length,
              itemBuilder: (BuildContext context, int index) {
                ModelChannelData data = _homeCtrl.channelDetails[index];
                print("length : ${_homeCtrl.channelDetails.length}");
                return InkWell(
                  onTap: () {
                    print("object not work");
                    launchUrl(
                        lanquage == 0

                            /// here hindi
                            ? Uri.parse(data.hindiUrl)
                            : lanquage == 1

                                /// here english
                                ? Uri.parse(data.englishUrl)
                                : lanquage == 2

                                    /// here punjabi
                                    ? Uri.parse(data.punjabiUrl)

                                    /// here hindi
                                    : Uri.parse(data.hindiUrl),
                        mode: LaunchMode.inAppWebView);
                  },
                  child: Card(
                    elevation: 5,
                    child: AspectRatio(
                        aspectRatio: 2 / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            lanquage == 0

                                /// here hindi
                                ? data.hindiLogo
                                : lanquage == 1

                                    /// here english
                                    ? data.englishLogo
                                    : lanquage == 2

                                        /// here punjabi
                                        ? data.punjabiLogo

                                        /// here hindi
                                        : data.hindiLogo,
                            fit: BoxFit.cover,
                          ),
                        )

                        //Image.network(data.image,fit: BoxFit.cover,),
                        ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
