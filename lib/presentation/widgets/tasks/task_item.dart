import 'package:clean_architecture/domain/entites/tasks/task_entity.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  const TaskItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      subtitle: Text(task.description),
    );
  }
}
