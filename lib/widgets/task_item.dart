import 'package:flutter/material.dart';
import 'package:taskify_app/widgets/task_model.dart';


class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color:  Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: GestureDetector(
          onTap: onToggle, 
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              border: Border.all(
                color: task.isCompleted
                    ? const Color.fromARGB(255, 75, 138, 243)
                    : const Color(0xFF6B7A99),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(6),
              color: task.isCompleted
                  ? const Color.fromARGB(255, 75, 138, 243)
                  : Colors.transparent,
            ),
            child: task.isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: task.isCompleted
                ? const Color(0xFF6B7A99)
                : Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        trailing: GestureDetector(
          onTap: onDelete,
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 100, 90),
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Icon(
              Icons.delete_outline_rounded,
              color: Theme.of(context).cardColor,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
