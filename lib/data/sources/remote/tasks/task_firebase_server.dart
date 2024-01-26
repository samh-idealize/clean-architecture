import 'package:clean_architecture/data/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskFirebaseService {
  final FirebaseFirestore db;

  TaskFirebaseService(this.db);

  Future<TaskModel> addTask({
    required String name,
    required String description,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await db.collection('tasks').doc(id).set({
      'id': id,
      'name': name,
      'description': description,
      'isComplete': false,
    });

    return TaskModel(
      id: id,
      name: name,
      description: description,
      isComplete: false,
    );
  }

  Future<List<TaskModel>> getTasks() async {
    final res = await db.collection('tasks').get();
    return res.docs.map((e) => TaskModel.fromJson(e.data())).toList();
  }
}
