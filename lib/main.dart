import 'package:clean_architecture/config/theme.dart';
import 'package:clean_architecture/firebase_options.dart';
import 'package:clean_architecture/injector.dart';
import 'package:clean_architecture/presentation/blocs/tasks/all_task/all_task_bloc.dart';
import 'package:clean_architecture/presentation/pages/tasks/all_task_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Registers all service locators
  initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<AllTaskBloc>(),
          ),
        ],
        child: const AllTaskScreen(),
      ),
    );
  }
}
