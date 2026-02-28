import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _titleController = TextEditingController(text: 'Mobile App Interface Optimization');
  final _descController = TextEditingController(text: 'Optimize the user interface for our mobile app, ensuring a seamless and delightful user experience...');
  String _project = 'App Enhancements';
  String _assigned = 'Guzman nura';
  DateTime _deadline = DateTime(2023, 10, 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new task'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save to draft', style: TextStyle(color: Color(0xFF6F4EFF), fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Task title',
                suffixText: '33/45',
                suffixStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Task description', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 24),

            const Text('Project name', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
                    child: Text(_project),
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(onPressed: () {}, child: const Text('Add new', style: TextStyle(color: Color(0xFF6F4EFF)))),
              ],
            ),
            const SizedBox(height: 24),

            const Text('Assigned to', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const CircleAvatar(radius: 18, backgroundColor: Color(0xFF6F4EFF), child: Text('GN', style: TextStyle(color: Colors.white))),
                  const SizedBox(width: 12),
                  Text(_assigned),
                  const Spacer(),
                  const Icon(Icons.close, size: 20),
                  const SizedBox(width: 12),
                  const Icon(Icons.add, color: Color(0xFF6F4EFF)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text('Deadline', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(context: context, initialDate: _deadline, firstDate: DateTime(2000), lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
                if (date != null) setState(() => _deadline = date);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 12),
                    Text(DateFormat('MMMM dd, yyyy').format(_deadline)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  final newTask = Task(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    description: _descController.text,
                    project: _project,
                    assignedTo: _assigned,
                    deadline: _deadline,
                    status: 'ongoing',
                  );
                  Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task created successfully!')));
                },
                child: const Text('Create new tasks'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}