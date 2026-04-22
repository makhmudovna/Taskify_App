import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/app/app_base.dart';
import 'package:taskify_app/providers/theme_provider.dart';
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

  void _addTask(String title) {
    if (title.isEmpty) return;
    _taskBox.add(Task(title: title));
    setState(() {});
  }

  void _toggleTask(dynamic key) {
    final task = _taskBox.get(key);
    if (task == null) return;
    task.isCompleted = !task.isCompleted;
    task.save();
    setState(() {});
  }

  void _deleteTask(dynamic key) {
    _taskBox.delete(key);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _taskBox.values.toList().reversed.toList();
    final remaining = tasks.where((t) => !t.isCompleted).length;

    return AppBase(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
              return GestureDetector(
                onTap: () => themeProvider.toggleTheme(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Icon(
                    themeProvider.isDarkMode
                        ? Icons.wb_sunny_outlined
                        : Icons.dark_mode_outlined,
                    color: themeProvider.isDarkMode
                        ? Colors.amber
                        : const Color(0xFF1A1D2E),
                  ),
                ),
              );
            }),
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
                AddTaskContainer(
                  onAdd: (title) => _addTask(title),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Tasks',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                      final task = tasks[index];
                      return TaskItem(
                        task: task,
                        onToggle: () => _toggleTask(task.key),
                        onDelete: () => _deleteTask(task.key),
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
