import 'package:clean_architecture/data/repositories/task_repository.dart';
import 'package:clean_architecture/data/sources/remote/tasks/task_firebase_server.dart';
import 'package:clean_architecture/domain/repositories/tasks/task_repository.dart';
import 'package:clean_architecture/domain/usecases/tasks/add_task_use_case.dart';
import 'package:clean_architecture/domain/usecases/tasks/get_tasks_use_case.dart';
import 'package:clean_architecture/presentation/blocs/tasks/all_task/all_task_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

/*Dependency injection is a design pattern that allows for decoupling 
components in your application, making it easier to manage dependencies, 
improve testability, and make your codebase more modular.
*/

final sl = GetIt.instance;

void initialise() {
  // Services
  sl.registerSingleton<FirebaseFirestore>(
    FirebaseFirestore.instance,
  );

  // Data Sources
  sl.registerSingleton<TaskFirebaseService>(
    TaskFirebaseService(sl()),
  );

  // Respoitories
  sl.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerSingleton<GetTasksUseCase>(
    GetTasksUseCase(sl()),
  );
  sl.registerSingleton<AddTaskUseCase>(
    AddTaskUseCase(sl()),
  );

  // Blocs
  /* AllTaskBloc is instantiated with a factory method. Unlike singletons, 
    a new instance of AllTaskBloc will be created each time it's requested from GetIt. 
    This is appropriate for Blocs because you typically want a new instance every time
    you create a new screen or component to ensure independent state management. 
    The AllTaskBloc takes instances of GetTasksUseCase and AddTaskUseCase as 
    dependencies, which are provided by GetIt. */

  sl.registerFactory<AllTaskBloc>(
    () => AllTaskBloc(sl(), sl()),
  );
}
