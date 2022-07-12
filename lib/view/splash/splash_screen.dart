import 'package:flutter/material.dart';
import 'package:simple_todo/common/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/splash_icon.png')),
          Positioned(
            left: 0,
            right: 0,
            bottom: kDefaultPadding * 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Simple',
                      style: kHeading.copyWith(
                        color: kWhite,
                      ),
                    ),
                    Text(
                      'Todo',
                      style: kHeading.copyWith(
                        color: kSecondaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding / 5),
                Text(
                  'Developed by Fajar',
                  style: kBodyInter.copyWith(
                    color: kWhite.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              color: kWhite,
              backgroundColor: kSecondaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
