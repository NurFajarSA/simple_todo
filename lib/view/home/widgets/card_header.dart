import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';

class CardHeader extends StatefulWidget {
  const CardHeader({Key? key, required this.stream}) : super(key: key);
  final Stream stream;

  @override
  State<CardHeader> createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {
  final HomeController _controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    widget.stream.listen((data) {
      mySetState();
    });
  }

  void mySetState() {
    setState(() {});
  }

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
                Obx(
                  () => Text(
                      '${_controller.todoBox.value.length + _controller.inprogressBox.value.length + _controller.completeBox.value.length} Task',
                      style: kHeading.copyWith(
                          color: kPrimaryColor, fontSize: 16.0)),
                ),
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
                    box: _controller.todoBox,
                    color: kDanger,
                  ),
                  VerticalDivider(
                    color: kDark.withOpacity(0.1),
                    thickness: 2,
                  ),
                  task(
                    title: 'In Progress',
                    box: _controller.inprogressBox,
                    color: kWarning,
                  ),
                  VerticalDivider(
                    color: kDark.withOpacity(0.1),
                    thickness: 2,
                  ),
                  task(
                    title: 'Complete',
                    box: _controller.completeBox,
                    color: kSuccess,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget task(
    {required String title, required Rx<Box<Task>> box, required Color color}) {
  return SizedBox(
    width: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            box.value.length.toString(),
            style: kSubHeading.copyWith(color: color, fontSize: 32),
          ),
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
