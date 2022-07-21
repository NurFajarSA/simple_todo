import 'package:flutter/material.dart';
import 'package:simple_todo/common/constant.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        padding: const EdgeInsets.all(kDefaultPadding),
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
            boxShadow: [
              kShadow,
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: kDefaultPadding * 2,
              backgroundImage: AssetImage('assets/images/photo_dev.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kDevName,
                  style: kHeading.copyWith(color: kDark),
                ),
                const SizedBox(height: kDefaultPadding / 3),
                Text(
                  kDevRole,
                  style: kBodyInter.copyWith(color: kDark),
                ),
              ],
            )
          ],
        ));
  }
}
