import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/controller/stream_controller.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/utils/route.dart';

class HomeController extends GetxController {
  final Rx<Box<Task>> todoBox = Hive.box<Task>(kTodo).obs;
  final Rx<Box<Task>> inprogressBox = Hive.box<Task>(kInprogress).obs;
  final Rx<Box<Task>> completeBox = Hive.box<Task>(kComplete).obs;

  Rx<Box<Task>> getData({required String section}) {
    switch (section) {
      case kTodo:
        return todoBox;
      case kInprogress:
        return inprogressBox;
      default:
        return completeBox;
    }
  }

  String getIcon(String section) {
    switch (section) {
      case kTodo:
        return 'assets/icons/todo_icon.png';
      case kInprogress:
        return 'assets/icons/inprogress_icon.png';
      default:
        return 'assets/icons/complete_icon.png';
    }
  }

  createTask() {
    Get.toNamed(createTaskRoute);
  }

  deleteTask(String section, int index) {
    if (section == kTodo) {
      todoBox.value.deleteAt(index);
    } else if (section == kInprogress) {
      inprogressBox.value.deleteAt(index);
    } else {
      completeBox.value.deleteAt(index);
    }
    headerStreamController.add('delete');
    update();
  }

  changeStatus(String toSection, String fromSection, Task? data, int index) {
    if (toSection == fromSection) {
      return;
    } else {
      deleteTask(fromSection, index);
      switch (toSection) {
        case kTodo:
          todoBox.value.add(data!);
          break;
        case kInprogress:
          inprogressBox.value.add(data!);
          break;
        default:
          completeBox.value.add(data!);
          break;
      }
      headerStreamController.add('delete');
      update();
    }
  }
}
