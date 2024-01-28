import 'package:flutter/material.dart';
import 'package:provider_test/domain/entities/task.dart';
import 'package:provider_test/presentation/widgets/shared/confirm_dialog_icon.dart';

class TaskTemplate extends StatelessWidget {
  final Task task;
  final VoidCallback onTapCallback;
  final VoidCallback onDeleteCallback;
  const TaskTemplate({
    super.key,
    required this.task,
    required this.onTapCallback,
    required this.onDeleteCallback,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: task.hasCompleted
          ? Colors.green[300]
          : Theme.of(context).colorScheme.surfaceVariant,
      child: Column(children: [
        _ListTile(
            onTapCallback: onTapCallback,
            task: task,
            onDeleteCallback: onDeleteCallback),
        const SizedBox(
          height: 7,
        )
      ]),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.onTapCallback,
    required this.task,
    required this.onDeleteCallback,
  });

  final VoidCallback onTapCallback;
  final Task task;
  final VoidCallback onDeleteCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapCallback,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      leading: TaskStatusIcon(
        hasCompletedTask: task.hasCompleted,
      ),
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 18,
          decoration: task.hasCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(task.dateCreated),
      trailing: _TaskContainer(
        onDeleteCallback: onDeleteCallback,
      ),
    );
  }
}

class TaskStatusIcon extends StatelessWidget {
  final bool hasCompletedTask;
  const TaskStatusIcon({
    super.key,
    required this.hasCompletedTask,
  });

  @override
  Widget build(BuildContext context) {
    final IconData icon = hasCompletedTask
        ? Icons.radio_button_checked
        : Icons.radio_button_unchecked;
    return Icon(
      icon,
      color: Colors.blue,
    );
  }
}

class _TaskContainer extends StatelessWidget {
  final VoidCallback onDeleteCallback;

  const _TaskContainer({
    required this.onDeleteCallback,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ConfirmDialogIcon(
        title: 'Delete Task',
        onConfirm: onDeleteCallback,
        description: 'Are you sure you want to delete this task?',
        iconDialog: const Icon(
          Icons.delete,
          size: 20,
        ),
      ),
    );
  }
}
