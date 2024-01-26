import 'package:clean_architecture/presentation/blocs/tasks/all_task/all_task_bloc.dart';
import 'package:clean_architecture/presentation/widgets/tasks/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class AllTaskScreen extends StatefulWidget {
  const AllTaskScreen({super.key});

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends State<AllTaskScreen> {
  // Initial data fetching
  @override
  void initState() {
    context.read<AllTaskBloc>().add(const GetTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<AllTaskBloc, AllTaskState>(
        builder: (context, state) {
          // This ensures that all states are handled
          return state.mapOrNull(
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (state) => Center(
                  child: Text(state.e.message),
                ),
                loaded: (state) => ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (ctx, i) => TaskItem(
                    task: state.tasks[i],
                  ),
                ),
              ) ??
              const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Since this is a demo, I won't create a new screen
          // to do this.
          context.read<AllTaskBloc>().add(const AddTask(
                title: "Task",
                description: "Description",
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    backgroundColor: Get.theme.primaryColor,
    title: const Text(
      "Tasks",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
