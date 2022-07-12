import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';

class CreateTaskController extends GetxController {
  final Box<Task> todoBox = Hive.box<Task>(kTodo);
  final Box<Task> inprogressBox = Hive.box<Task>(kInprogress);
  final Box<Task> completeBox = Hive.box<Task>(kComplete);

  addDummyTask() {
    todoBox.add(Task(name: "Task 1", status: kTodo));
    print(todoBox.length);
    Get.back();
  }
}
