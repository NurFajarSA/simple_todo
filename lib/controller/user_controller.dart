import 'package:get/get.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/user/user.dart';

class UserController extends GetxController {
  final User _user = User(name: kNewUser);  // Default User
  User get user => _user;

  void login({required String name}) {
    _user.setName = name;
  }
}
