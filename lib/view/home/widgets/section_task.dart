import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';
import 'package:simple_todo/view/home/widgets/card_task.dart';
import 'package:simple_todo/view/home/widgets/empty_state.dart';

class SectionTask extends StatelessWidget {
  SectionTask({Key? key, required this.section}) : super(key: key);
  final String section;
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final Box<Task> data = homeController.getData(section: section);
    return Container(
      color: kWhitebg,
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: data.listenable(),
              builder: (context, Box tasks, _) {
                if (tasks.isEmpty) {
                  return const EmptyState();
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardTask(data: data.getAt(index));
                      });
                }
              }),
        ],
      ),
    );
  }
}
