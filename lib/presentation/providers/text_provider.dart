import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_test/domain/entities/task.dart';

class TextProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  List<Task> taskList = [];

  Future<void> addTask(String text) async {
    if (text.isEmpty) return;
    final dateFormated = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    final newTask = Task(
      title: text,
      dateCreated: dateFormated,
    );
    taskList.add(newTask);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> deleteTask(Task task) async {
    taskList.remove(task);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    task.hasCompleted = !task.hasCompleted;
    notifyListeners();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
