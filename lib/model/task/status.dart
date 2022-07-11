import 'package:simple_todo/common/constant.dart';

class Status {
  String current;

  Status({this.current = kTodo});

  @override
  String toString() {
    return current;
  }

  get getCurrent => current;

  void setTodo() {
    current = kTodo;
  }

  void setInprogress() {
    current = kInprogress;
  }

  void setComplete() {
    current = kComplete;
  }
}
