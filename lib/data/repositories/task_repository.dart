import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/domain/entites/task_entity.dart';
import 'package:clean_architecture/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_result/src/result.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<Result<TaskEntity, Failure>> addTask(
      {required String name, required String description}) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit, Failure>> completeTask(String id) {
    // TODO: implement completeTask
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit, Failure>> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TaskEntity>, Failure>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }
}
