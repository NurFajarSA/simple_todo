import 'package:get/get.dart';
import 'package:simple_todo/view/about_dev/controller/about_dev_controller.dart';

class AboutDevBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutDevController());
  }
}
