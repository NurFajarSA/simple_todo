import 'package:get/instance_manager.dart';
import 'package:simple_todo/view/create_task/controller/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateTaskController());
  }
}
