class Task {
  final String id;
  final String title;
  final String description;
  final String project;
  final String assignedTo;
  final DateTime deadline;
  final String status; 

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.project,
    required this.assignedTo,
    required this.deadline,
    required this.status,
  });
}
