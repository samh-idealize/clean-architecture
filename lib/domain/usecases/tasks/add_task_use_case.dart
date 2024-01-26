import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/domain/entites/tasks/task_entity.dart';
import 'package:clean_architecture/domain/repositories/tasks/task_repository.dart';
import 'package:freezed_result/freezed_result.dart';

class AddTaskUseCase {
  final TaskRepository _taskRepository;

  AddTaskUseCase(this._taskRepository);

  Future<Result<TaskEntity, Failure>> call({
    required String name,
    required String description,
  }) async {
    return await _taskRepository.addTask(
      name: name,
      description: description,
    );
  }
}
