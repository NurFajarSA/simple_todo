import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/view/about_dev/controller/about_dev_controller.dart';
import 'package:simple_todo/view/about_dev/widgets/card_profile.dart';
import 'package:simple_todo/view/widgets/button/custom_footer_button.dart';

class AboutDevScreen extends StatelessWidget {
  AboutDevScreen({Key? key}) : super(key: key);
  final _controller = Get.find<AboutDevController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kPrimaryColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          color: kDark,
        ),
        title: Text("About Dev", style: kSubHeading.copyWith(color: kDark)),
        centerTitle: true,
        backgroundColor: kWhite,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: kDark.withOpacity(0.1),
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        color: kWhitebg,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.51,
                  child: Stack(children: [
                    Image.asset('assets/images/dev_bg.png',
                        width: MediaQuery.of(context).size.width),
                    const Positioned(
                        bottom: 0, left: 0, right: 0, child: CardProfile()),
                  ]),
                ),
                const SizedBox(height: kDefaultPadding),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding + 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description'.toUpperCase(),
                          style: kSubHeading.copyWith(color: kDark)),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(kDevDesc,
                          style: kBodyPoppins.copyWith(
                              color: kDark.withOpacity(0.8)),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        CustomFooterButton(
          label: 'More About Dev',
          onPressed: () {
            _controller.gotoMoreAboutDev();
          },
        ),
      ],
    );
  }
}
