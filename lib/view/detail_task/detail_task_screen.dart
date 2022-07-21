import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/view/create_task/controller/create_task_controller.dart';
import 'package:simple_todo/view/detail_task/controller/detail_task_controller.dart';
import 'package:simple_todo/view/widgets/button/custom_footer_button.dart';
import 'package:simple_todo/view/widgets/button/pop_up_status.dart';
import 'package:simple_todo/view/widgets/custom_textfield.dart';

class DetailTaskScreen extends StatefulWidget {
  DetailTaskScreen({Key? key}) : super(key: key);
  final Stream stream = createTaskStreamController.stream;

  @override
  State<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends State<DetailTaskScreen> {
  final controller = Get.find<DetailTaskController>();
  final controllerTask = Get.find<CreateTaskController>();
  var popUp = PopUpStatus(
    section: kTodo,
    iconSize: 32.0,
  );

  @override
  void initState() {
    super.initState();
    popUp = popUp = PopUpStatus(
      section: controller.taskStatusController.text.toUpperCase(),
      iconSize: 32.0,
    );
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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kPrimaryColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          color: kDark,
        ),
        title: Text("Task Detail", style: kSubHeading.copyWith(color: kDark)),
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
                    validator: (val) => controllerTask.isEmpty(val),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomFooterButton(
              width: MediaQuery.of(context).size.width * 0.75,
              label: 'Update Task',
              onPressed: () {
                controller.updateTask();
              },
            ),
            Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 2),
              child: IconButton(
                onPressed: () => showCustomDialog(context),
                icon: const Icon(
                  Icons.delete,
                  color: kDanger,
                ),
              ),
            )
          ],
        ),
      ],
    );
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
                          controller.deleteTask();
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
