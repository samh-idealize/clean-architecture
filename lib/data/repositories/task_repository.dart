import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/data/sources/remote/tasks/task_firebase_server.dart';
import 'package:clean_architecture/domain/entites/tasks/task_entity.dart';
import 'package:clean_architecture/domain/repositories/tasks/task_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_result/src/result.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskFirebaseService _taskFirebaseService;

  TaskRepositoryImpl(this._taskFirebaseService);

  @override
  Future<Result<TaskEntity, Failure>> addTask({
    required String name,
    required String description,
  }) async {
    try {
      final res = await _taskFirebaseService.addTask(
        name: name,
        description: description,
      );
      return Result.success(res);
    } on FirebaseException catch (e) {
      return Result.failure(Failure.fromFirebaseException(e));
    } catch (e) {
      return Result.failure(Failure.fromErr(e));
    }
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
  Future<Result<List<TaskEntity>, Failure>> getTasks() async {
    try {
      final res = await _taskFirebaseService.getTasks();
      return Result.success(res);
    } on FirebaseException catch (e) {
      return Result.failure(Failure.fromFirebaseException(e));
    } catch (e) {
      return Result.failure(Failure.fromErr(e));
    }
  }
}
