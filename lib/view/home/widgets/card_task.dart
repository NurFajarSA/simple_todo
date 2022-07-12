import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';

class CardTask extends StatelessWidget {
  const CardTask({Key? key, required this.data}) : super(key: key);
  final Task? data;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
            boxShadow: [
              kShadow,
            ]),
        child: Row(
          children: [
            Image.asset('name'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${data?.name}",
                  style: kSubHeading.copyWith(color: kDark),
                ),
                Text(
                  "${data?.dateRange}",
                  style: kBodyInter.copyWith(color: kDark),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: kDanger,
              onPressed: () {},
            ),
          ],
        ));
  }
}
