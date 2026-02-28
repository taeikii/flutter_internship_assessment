import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Homepage Redesign',
      description: 'Redesign the homepage of our website to improve user engagement...',
      project: 'Website Revamp',
      assignedTo: 'Andre',
      deadline: DateTime(2023, 10, 15),
      status: 'new',
    ),
    Task(
      id: '2',
      title: 'Mobile App Interface Optimization',
      description: 'Optimize the user interface for our mobile app...',
      project: 'App Enhancements',
      assignedTo: 'Guzman Nura',
      deadline: DateTime(2023, 10, 15),
      status: 'ongoing',
    ),
    Task(
      id: '3',
      title: 'E-commerce Checkout Redesign',
      description: 'Redesign the checkout process for our e-commerce platform...',
      project: 'E-commerce',
      assignedTo: 'Team',
      deadline: DateTime(2023, 10, 18),
      status: 'completed',
    ),
  ];

  String _currentTab = 'All';
  String _searchQuery = '';

  List<Task> get filteredTasks {
    var list = _tasks.where((task) {
      final matchesSearch = task.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          task.description.toLowerCase().contains(_searchQuery.toLowerCase());
      if (_currentTab == 'All') return matchesSearch;
      if (_currentTab == 'In Progress') return matchesSearch && task.status == 'ongoing';
      if (_currentTab == 'Completed') return matchesSearch && task.status == 'completed';
      return matchesSearch;
    }).toList();
    return list;
  }

  String get currentTab => _currentTab;

  void setTab(String tab) {
    _currentTab = tab;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}