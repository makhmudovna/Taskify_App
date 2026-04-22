import 'package:flutter/material.dart';

class AddTaskContainer extends StatefulWidget {
  const AddTaskContainer({super.key});

  @override
  State<AddTaskContainer> createState() => _AddTaskContainerState();
}

class _AddTaskContainerState extends State<AddTaskContainer> {
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Color.fromARGB(255, 75, 138, 243), size: 40,),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                hintText: 'Add a new task...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color(0xFF6B7A99),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 138, 243),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(120, 75, 138, 243),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}