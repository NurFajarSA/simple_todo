import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';

// ignore: must_be_immutable
class PopUpStatus extends StatefulWidget {
  PopUpStatus(
      {Key? key, this.data, this.index, required this.section, this.iconSize})
      : super(key: key);
  String section;
  final Task? data;
  final int? index;
  final double? iconSize;

  @override
  State<PopUpStatus> createState() => _PopUpStatusState();

  String get status => section;
}

class _PopUpStatusState extends State<PopUpStatus> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    String section = widget.section;
    Task? data = widget.data;
    int? index = widget.index;

    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
      onSelected: (String status) {
        data != null && index != null
            ? controller.changeStatus(status, section, data, index)
            : setState(() {
                widget.section = status;
                createTaskStreamController.add('change status');
              });
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
                        color: kDark, fontFamily: 'poppins-regular'),
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
                        color: kDark, fontFamily: 'poppins-regular'),
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
                        color: kDark, fontFamily: 'poppins-regular'),
                  ),
                ],
              ),
            ),
          ]),
      tooltip: 'Change Status',
      icon: Image.asset(
        controller.getIcon(section),
        height: widget.iconSize,
      ),
      padding: const EdgeInsets.all(0),
    );
  }
}
