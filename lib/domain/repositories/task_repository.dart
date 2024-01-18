import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/domain/entites/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_result/freezed_result.dart';

abstract interface class TaskRepository {
  Future<Result<List<TaskEntity>, Failure>> getTasks();

  Future<Result<TaskEntity, Failure>> addTask({
    required String name,
    required String description,
  });

  Future<Result<Unit, Failure>> deleteTask(String id);

  Future<Result<Unit, Failure>> completeTask(String id);
}
