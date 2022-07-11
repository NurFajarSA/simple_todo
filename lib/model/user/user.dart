import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';

class User {
  String name;
  List<Task> tasks = [];

  set setName(String name) => this.name = name;

  User({
    required this.name,
  });

  int countTodo() {
    int temp = 0;
    if (tasks.isNotEmpty) {
      for (var task in tasks) {
        if (task.status?.current == kTodo) {
          temp++;
        }
      }
    }
    return temp;
  }

  int countInprogress() {
    int temp = 0;
    if (tasks.isNotEmpty) {
      for (var task in tasks) {
        if (task.status?.current == kInprogress) {
          temp++;
        }
      }
    }
    return temp;
  }

  int countComplete() {
    int temp = 0;
    if (tasks.isNotEmpty) {
      for (var task in tasks) {
        if (task.status?.current == kComplete) {
          temp++;
        }
      }
    }
    return temp;
  }
}
