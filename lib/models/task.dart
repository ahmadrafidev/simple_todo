class Task {
  final String? id;
  final String? name;
  final DateTime? date;
  bool? isDone;

  Task({
    required this.id,
    required this.name,
    required this.date,
    this.isDone = false,
  });
}