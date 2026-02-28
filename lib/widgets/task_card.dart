import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  Color get statusColor {
    if (task.status == 'new') return const Color(0xFF6366F1);
    if (task.status == 'ongoing') return const Color(0xFF10B981);
    return const Color(0xFF8B5CF6);
  }

  String get statusText {
    if (task.status == 'new') return 'New task';
    if (task.status == 'ongoing') return 'On going';
    return 'Completed';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(fontSize: 12, color: statusColor, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            task.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: Colors.grey, height: 1.4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.folder_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(task.project, style: const TextStyle(fontSize: 13, color: Colors.grey)),
              const Spacer(),
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text('${task.deadline.day}/${task.deadline.month}/${task.deadline.year}',
                  style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}