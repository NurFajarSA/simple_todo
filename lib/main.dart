import 'package:flutter/material.dart';
import 'package:simple_todo/common/constant.dart';
import 'package:simple_todo/model/task/task.dart';
import 'package:simple_todo/simple_todo_app.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(kTodo);
  await Hive.openBox<Task>(kInprogress);
  await Hive.openBox<Task>(kComplete);
  runApp(const SimpleTodoApp());
}
