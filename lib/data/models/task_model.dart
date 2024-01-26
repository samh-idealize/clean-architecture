import 'package:clean_architecture/domain/entites/tasks/task_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel extends TaskEntity {
  TaskModel({
    required super.name,
    required super.description,
    required super.isComplete,
    required super.id,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
