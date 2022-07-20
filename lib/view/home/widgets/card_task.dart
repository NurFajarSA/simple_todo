import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';
import 'package:simple_todo/view/widgets/button/pop_up_status.dart';

class CardTask extends StatelessWidget {
  CardTask(
      {Key? key,
      required this.data,
      required this.index,
      required this.section})
      : super(key: key);
  final Task? data;
  final int index;
  final String section;
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 3),
        decoration: BoxDecoration(boxShadow: [
          kShadow,
        ]),
        child: Material(
          color: kWhite,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          child: InkWell(
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
            onTap: () {
              // TODO: implement
              Get.snackbar('Task', 'Soon',
                  colorText: kDark, backgroundColor: kWhite.withOpacity(0.5));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(kDefaultPadding,
                  kDefaultPadding, kDefaultPadding / 2, kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PopUpStatus(section: section, data: data, index: index),
                      const SizedBox(width: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${data?.name}",
                            style: kSubHeading.copyWith(color: kDark),
                          ),
                          Text(
                            "${data?.dateRange.toString()}",
                            style: kBodyInter.copyWith(color: kDark),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.delete),
                    color: kDanger,
                    onPressed: () {
                      showCustomDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void showCustomDialog(BuildContext context) => showDialog(
      context: context,
      builder: (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.delete,
                    color: kDanger,
                    size: 42,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  const Text(
                    "Delete task?",
                    style: kSubHeading,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  const Text(
                    "Are you sure want to delete this task?",
                    style: kBodyInter,
                  ),
                  const Text(
                    "You can’t undo this action.",
                    style: kBodyInter,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          _controller.deleteTask(section, index);
                          Get.back();
                        },
                        child: SizedBox(
                            height: 32,
                            width: 94,
                            child: Center(
                                child: Text("Delete",
                                    style:
                                        kSubHeading.copyWith(color: kDanger)))),
                      ),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const SizedBox(
                            height: 32,
                            width: 94,
                            child: Center(
                                child: Text("Close", style: kSubHeading))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
}
