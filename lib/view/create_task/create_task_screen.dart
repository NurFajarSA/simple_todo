import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/view/create_task/controller/create_task_controller.dart';
import 'package:simple_todo/view/widgets/button/custom_footer_button.dart';
import 'package:simple_todo/view/widgets/button/pop_up_status.dart';
import 'package:simple_todo/view/widgets/custom_textfield.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key, required this.stream}) : super(key: key);
  final Stream stream;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final controller = Get.find<CreateTaskController>();

  final popUp = PopUpStatus(
    section: kTodo,
    iconSize: 32.0,
  );

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
    controller.taskStatusController.text = '${popUp.status.capitalize}';
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
      body: ListView(children: [
        Container(
          color: kWhitebg,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                    label: 'Task Name',
                    hint: 'Enter your task name',
                    controller: controller.taskNameController,
                    validator: (val) => controller.isEmpty(val),
                    isMandatory: true),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: 'Status',
                  hint: 'Select status',
                  keyboardType: TextInputType.none,
                  isMandatory: true,
                  controller: controller.taskStatusController,
                  icon: popUp,
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Date",
                  hint: "Select Date",
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  controller: controller.taskDateController,
                  icon: const Icon(
                    Icons.calendar_today,
                  ),
                  onTap: () {
                    controller.chooseDate(context: context);
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "Start Time",
                  hint: "Select Time",
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  controller: controller.taskStartTimeController,
                  icon: const Icon(
                    Icons.access_time,
                  ),
                  onTap: () {
                    controller.chooseTime(context: context, type: 'start');
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                  label: "End Time",
                  hint: "Select Time",
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  controller: controller.taskEndTimeController,
                  icon: const Icon(
                    Icons.access_time,
                  ),
                  onTap: () {
                    controller.chooseTime(context: context, type: 'end');
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                CustomTextField(
                    label: 'Task Description',
                    hint: 'Enter your task description',
                    controller: controller.taskDescriptionController,
                    maxLines: 5),
              ],
            ),
          ),
        ),
      ]),
      persistentFooterButtons: [
        CustomFooterButton(
          label: 'Create Task',
          onPressed: () {
            controller.addTask();
          },
        ),
      ],
    );
  }
}
