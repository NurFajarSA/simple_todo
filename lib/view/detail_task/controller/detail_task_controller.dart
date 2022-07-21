import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/model/task/task.dart';

class DetailTaskController extends GetxController {
  Task? _data;
  late int _index;
  Task? get data => _data;
  int get index => _index;
  late String statusInit;

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

  @override
  void onInit() {
    super.onInit();
    _data = Get.arguments['task'];
    _index = Get.arguments['index'];
    taskNameController.text = _data!.name;
    taskDescriptionController.text = _data!.description!;
    taskStatusController.text = _data!.status;
    taskDateController.text = _data!.dateRange!;
    taskStartTimeController.text = _data!.startTime!;
    taskEndTimeController.text = _data!.endTime!;
    statusInit = _data!.status;
  }

  updateTask() {
    _data!.name = taskNameController.text;
    _data!.description = taskDescriptionController.text;
    _data!.status = taskStatusController.text;
    _data!.dateRange = taskDateController.text;
    _data!.startTime = taskStartTimeController.text;
    _data!.endTime = taskEndTimeController.text;

    if (statusInit.toUpperCase() != _data!.status.toUpperCase()) {
      changeStatus(_data!.status.toUpperCase(), statusInit.toUpperCase(), data);
    }

    cardTaskStreamController.add('update');
    Get.back();
  }

  changeStatus(String toSection, String fromSection, Task? data) {
    if (toSection == fromSection) {
      return;
    } else {
      deleteTask();
      switch (toSection) {
        case kTodo:
          data?.status = kTodo;
          todoBox.add(data!);
          break;
        case kInprogress:
          data?.status = kInprogress;
          inprogressBox.add(data!);
          break;
        default:
          data?.status = kComplete;
          completeBox.add(data!);
          break;
      }
      update();
    }
  }

  deleteTask() {
    String section = _data!.status.toUpperCase();
    if (section == kTodo) {
      todoBox.deleteAt(_index);
    } else if (section == kInprogress) {
      inprogressBox.deleteAt(_index);
    } else {
      completeBox.deleteAt(_index);
    }
    headerStreamController.add('delete');
    update();
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

  get getName => taskNameController.text;
  get getDescription => taskDescriptionController.text;
  get getStatus => taskStatusController.text;
  get getDate => taskDateController.text;
  get getStartTime => taskStartTimeController.text;
  get getEndTime => taskEndTimeController.text;
  get getFormKey => formKey;
}
