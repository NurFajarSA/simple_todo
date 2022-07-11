import 'package:get/get.dart';
import 'package:simple_todo/controller/user_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    
    Get.put(UserController(), permanent: true);
  }
}