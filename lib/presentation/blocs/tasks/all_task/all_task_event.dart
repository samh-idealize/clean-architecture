part of 'all_task_bloc.dart';

@freezed
class AllTaskEvent with _$AllTaskEvent {
  const factory AllTaskEvent.getTasks() = GetTasks;
  const factory AllTaskEvent.addTask({
    required String title,
    required String description,
  }) = AddTask;
}
