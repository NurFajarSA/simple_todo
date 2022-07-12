import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/view/create_task/controller/create_task_controller.dart';
import 'package:simple_todo/widgets/button/custom_footer_button.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({Key? key}) : super(key: key);
  final controller = Get.find<CreateTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kDark,
        ),
        title: Text("Create a Task", style: kSubHeading.copyWith(color: kDark)),
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
      body: const Center(
        child: Text('Create Task'),
      ),
      persistentFooterButtons: [
        CustomFooterButton(
          label: 'Create Task',
          onPressed: () {
            controller.addDummyTask();
          },
        ),
      ],
    );
  }
}
