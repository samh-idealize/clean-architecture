import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/domain/entites/tasks/task_entity.dart';
import 'package:clean_architecture/domain/repositories/tasks/task_repository.dart';
import 'package:freezed_result/freezed_result.dart';

class GetTasksUseCase {
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  Future<Result<List<TaskEntity>, Failure>> call() async {
    return await _taskRepository.getTasks();
  }
}
