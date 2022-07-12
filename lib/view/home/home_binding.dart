import 'package:get/get.dart';
import 'package:simple_todo/view/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
