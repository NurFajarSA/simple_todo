import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo/model/task/status.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  static int taskId = 0;

  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTimeRange? dateRange;

  @HiveField(3)
  TimeOfDay? startTime;

  @HiveField(4)
  TimeOfDay? endTime;

  @HiveField(5)
  Status? status;

  @HiveField(6)
  String? description;

  Task(
      {this.id,
      required this.name,
      this.dateRange,
      this.startTime,
      this.endTime,
      this.status,
      this.description}) {
    id = ++taskId;
    status = Status();
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, dateRange: $dateRange, startTime: $startTime, endTime: $endTime, status: $status, description: $description}';
  }
}
