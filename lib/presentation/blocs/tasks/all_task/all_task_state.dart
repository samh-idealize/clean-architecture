part of 'all_task_bloc.dart';

/* 
Whenever I create a new BLOC state, I always follow this pattern
of creating states:

- Initial (Whenever the BLOC is created, this is the first state)
- Loading (When the BLOC is fetching data)
- Loaded (When the BLOC has fetched data)
- Error (When the BLOC has encountered an error)

*/

@freezed
class AllTaskState with _$AllTaskState {
  const factory AllTaskState.initial() = _Initial;
  const factory AllTaskState.loading() = _Loading;
  const factory AllTaskState.loaded(List<TaskEntity> tasks) = _Loaded;
  const factory AllTaskState.error(Failure e) = _Error;
}
