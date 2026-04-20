import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  const LoginForm(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.isPassword = false});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscurePassword : false,
      keyboardType:
          widget.isPassword ? TextInputType.text : TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.icon,
          color: const Color(0xFF6B7A99),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
                icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFF6B7A99)))
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: Color(0xFF6B7A99), fontSize: 12),
      ),
    );
  }
}
