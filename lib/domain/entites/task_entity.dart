class TaskEntity {
  final String id;
  final String name;
  final String description;
  final bool isComplete;

  const TaskEntity({
    required this.name,
    required this.description,
    required this.isComplete,
    required this.id,
  });
}
