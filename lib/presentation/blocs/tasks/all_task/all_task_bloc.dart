import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/domain/entites/tasks/task_entity.dart';
import 'package:clean_architecture/domain/usecases/tasks/add_task_use_case.dart';
import 'package:clean_architecture/domain/usecases/tasks/get_tasks_use_case.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_task_event.dart';
part 'all_task_state.dart';
part 'all_task_bloc.freezed.dart';

class AllTaskBloc extends Bloc<AllTaskEvent, AllTaskState> {
  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  AllTaskBloc(
    this._addTaskUseCase,
    this._getTasksUseCase,
  ) : super(const AllTaskState.initial()) {
    on<GetTasks>((event, emit) async {
      emit(const AllTaskState.loading());
      final res = await _getTasksUseCase.call();
      res.when(
        success: (tasks) => emit(AllTaskState.loaded(tasks)),
        failure: (e) => emit(AllTaskState.error(e)),
      );
    });
    on<AddTask>((event, emit) async {
      emit(const AllTaskState.loading());
      final res = await _addTaskUseCase.call(
        name: event.title,
        description: event.description,
      );
      res.when(
        success: (task) => add(const GetTasks()),
        failure: (e) => emit(AllTaskState.error(e)),
      );
    });
  }
}
