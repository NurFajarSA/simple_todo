import 'package:get/get.dart';
import 'package:simple_todo/view/create_task/controller/create_task_controller.dart';
import 'package:simple_todo/view/detail_task/controller/detail_task_controller.dart';

class DetailTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailTaskController());
    Get.put(CreateTaskController());
  }
}
