import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';

class HomeController extends GetxController {
  late Box<Task> todoBox;
  late Box<Task> inprogressBox;
  late Box<Task> completeBox;

  @override
  void onInit() {
    super.onInit();
    todoBox = Hive.box<Task>(kTodo);
    inprogressBox = Hive.box<Task>(kInprogress);
    completeBox = Hive.box<Task>(kComplete);
  }

  Box<Task> getData({required String section}) {
    switch (section) {
      case kTodo:
        return todoBox;
      case kInprogress:
        return inprogressBox;
      default:
        return completeBox;
    }
  }

  int countTodo() {
    return todoBox.length;
  }

  int countInprogress() {
    return inprogressBox.length;
  }

  int countComplete() {
    return completeBox.length;
  }

  int totalTask() {
    return todoBox.length + inprogressBox.length + completeBox.length;
  }
}
