import 'package:flutter/material.dart';
import 'package:taskify_app/pages/task_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TaskPage())),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 75, 138, 243),
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: const Color.fromARGB(120, 75, 138, 243),
        elevation: 8,
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
