import 'package:flutter/material.dart';

class IconLogo extends StatelessWidget {
  const IconLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 75, 138, 243),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 108, 142, 245),
                blurRadius: 20,
                offset: Offset(0, 8))
          ]),
      child: const Icon(
        Icons.check_rounded,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}