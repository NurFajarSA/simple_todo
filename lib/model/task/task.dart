import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  static int taskId = 0;

  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? dateRange;

  @HiveField(3)
  String? startTime;

  @HiveField(4)
  String? endTime;

  @HiveField(5)
  String status;

  @HiveField(6)
  String? description;

  Task(
      {this.id,
      required this.name,
      this.dateRange,
      this.startTime,
      this.endTime,
      required this.status,
      this.description}) {
    id = ++taskId;
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, dateRange: $dateRange, startTime: $startTime, endTime: $endTime, status: $status, description: $description}';
  }
}
