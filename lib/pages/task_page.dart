import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskify_app/app/app_base.dart';
import 'package:taskify_app/widgets/add_task_container.dart';
import 'package:taskify_app/widgets/task_item.dart';
import 'package:taskify_app/widgets/task_model.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _taskController = TextEditingController();
  late Box<Task> _taskBox;

  @override
  void initState() {
    _taskBox = Hive.box<Task>('task');
    super.initState();
  }

  void _addTask() {
    final title = _taskController.text.trim();
    if (title.isEmpty) return;
    _taskBox.add(Task(title: title));
    _taskController.clear();
    setState(() {});
  }

  void _toggleTask(int index) {
    final task = _taskBox.getAt(index);
    task.isCompleted = !task.isCompleted;
    task.save();
    setState(() {});
  }

  void _deleteTask(int index) {
    _taskBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _taskBox.values.toList();
    final remaining = tasks.where((t) => !t.isCompleted).length;
    
    return AppBase(
        backgroundColor: const Color.fromARGB(255, 227, 227, 248),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 240, 247),
          automaticallyImplyLeading: false,
          title: const Text(
            'My Tasks',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: false,
          actions: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: const Icon(Icons.dark_mode_outlined),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const AddTaskContainer(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      'All Tasks',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text('${tasks.length} total',
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xFF6B7A99))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        task: tasks[index],
                        onToggle: () => setState(() {
                          tasks[index].isCompleted = !tasks[index].isCompleted;
                        }),
                        onDelete: () => setState(() {
                          tasks.removeAt(index);
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
