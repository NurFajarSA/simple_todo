import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';
import 'package:simple_todo/view/home/widgets/card_header.dart';

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
                      PopupMenuButton<String>(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding / 2)),
                        onSelected: (String status) {
                          _controller.changeStatus(
                              status, section, data, index);
                        },
                        itemBuilder: ((context) => [
                              PopupMenuItem(
                                value: kTodo,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: kDanger,
                                      size: kDefaultPadding,
                                    ),
                                    const SizedBox(
                                      width: kDefaultPadding / 2,
                                    ),
                                    Text(
                                      'To Do',
                                      style: kSubHeading.copyWith(
                                          color: kDark,
                                          fontFamily: 'poppins-regular'),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: kInprogress,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: kWarning,
                                      size: kDefaultPadding,
                                    ),
                                    const SizedBox(
                                      width: kDefaultPadding / 2,
                                    ),
                                    Text(
                                      'In Progress',
                                      style: kSubHeading.copyWith(
                                          color: kDark,
                                          fontFamily: 'poppins-regular'),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: kComplete,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: kSuccess,
                                      size: kDefaultPadding,
                                    ),
                                    const SizedBox(
                                      width: kDefaultPadding / 2,
                                    ),
                                    Text(
                                      'Complete',
                                      style: kSubHeading.copyWith(
                                          color: kDark,
                                          fontFamily: 'poppins-regular'),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        tooltip: 'Change Status',
                        icon: Image.asset(_controller.getIcon(section)),
                        padding: const EdgeInsets.all(0),
                      ),
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
                      _controller.deleteTask(section, index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
