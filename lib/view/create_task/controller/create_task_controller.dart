import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:intl/intl.dart';

class CreateTaskController extends GetxController {
  final Box<Task> todoBox = Hive.box<Task>(kTodo);
  final Box<Task> inprogressBox = Hive.box<Task>(kInprogress);
  final Box<Task> completeBox = Hive.box<Task>(kComplete);
  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  final taskStatusController = TextEditingController();
  final taskDateController = TextEditingController();
  final taskStartTimeController = TextEditingController();
  final taskEndTimeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addTask() {
    if (taskNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter task name',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          backgroundColor: kDanger,
          colorText: kWhite,
          icon: const Icon(
            Icons.error_outline_rounded,
            color: kWhite,
          ));
      return;
    }
    switch (taskStatusController.text.toUpperCase()) {
      case kTodo:
        todoBox.add(Task(
          name: taskNameController.text,
          description: taskDescriptionController.text,
          status: kTodo,
          dateRange: taskDateController.text,
          startTime: taskStartTimeController.text,
          endTime: taskEndTimeController.text,
        ));
        break;
      case kInprogress:
        inprogressBox.add(Task(
          name: taskNameController.text,
          description: taskDescriptionController.text,
          status: kTodo,
          dateRange: taskDateController.text,
          startTime: taskStartTimeController.text,
          endTime: taskEndTimeController.text,
        ));
        break;
      default:
        completeBox.add(Task(
          name: taskNameController.text,
          description: taskDescriptionController.text,
          status: kTodo,
          dateRange: taskDateController.text,
          startTime: taskStartTimeController.text,
          endTime: taskEndTimeController.text,
        ));
    }
    headerStreamController.add('add');
    Get.back();
  }

  chooseDate({required BuildContext context}) async {
    final date = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now().add(const Duration(days: 1))),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      taskDateController.text =
          '${DateFormat('dd/MM/yyyy').format(date.start)} - ${DateFormat('dd/MM/yyyy').format(date.end)}';
    }
  }

  chooseTime({required BuildContext context, required String type}) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (type == 'start') {
      taskStartTimeController.text =
          '${time!.hour}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      taskEndTimeController.text =
          '${time!.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
  }

  isEmpty(value) {
    if (value.isEmpty) {
      return "Please complete this field";
    } else {
      return null;
    }
  }
}
