import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';

class CardHeader extends StatelessWidget {
  CardHeader({Key? key}) : super(key: key);
  final _controller = Get.find<HomeController>();

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Task',
                  style:
                      kHeading.copyWith(color: kPrimaryColor, fontSize: 16.0),
                ),
                // TODO ; Add total task count
                Text('${_controller.totalTask()} Task',
                    style: kHeading.copyWith(
                        color: kPrimaryColor, fontSize: 16.0)),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              child: Divider(
                color: kDark.withOpacity(0.1),
                thickness: 2,
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  task(
                    title: 'To Do',
                    count: _controller.countTodo(),
                    color: kDanger,
                  ),
                  VerticalDivider(
                    color: kDark.withOpacity(0.1),
                    thickness: 2,
                  ),
                  task(
                    title: 'In Progress',
                    count: _controller.countInprogress(),
                    color: kWarning,
                  ),
                  VerticalDivider(
                    color: kDark.withOpacity(0.1),
                    thickness: 2,
                  ),
                  task(
                    title: 'Complete',
                    count: _controller.countComplete(),
                    color: kSuccess,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget task({required String title, required int count, required Color color}) {
  return SizedBox(
    width: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: kSubHeading.copyWith(color: color, fontSize: 32),
        ),
        Text(
          title,
          style:
              kSubHeading.copyWith(color: color, fontFamily: 'poppins-regular'),
        ),
      ],
    ),
  );
}
