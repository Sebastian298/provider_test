import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/presentation/providers/text_provider.dart';
import 'package:provider_test/presentation/widgets/shared/message_field_box.dart';
import 'package:provider_test/presentation/widgets/task/task_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('To do list'),
            SizedBox(
              width: 12,
            )
          ],
        ),
      ),
      body: _TextScreen(),
    );
  }
}

class _TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TextProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ListView.builder(
                controller: taskProvider.scrollController,
                itemCount: taskProvider.taskList.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.taskList[index];
                  return TaskTemplate(
                    task: task,
                    onTapCallback: () {
                      taskProvider.toggleTaskCompletion(task);
                    },
                    onDeleteCallback: () {
                      taskProvider.deleteTask(task);
                    },
                  );
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => taskProvider.addTask(value),
              hindText: 'Create Task',
            )
          ],
        ),
      ),
    );
  }
}
