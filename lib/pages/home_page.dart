import 'package:flutter/material.dart';
import 'package:taskify_app/app/app_base.dart';
import 'package:taskify_app/widgets/icon_logo.dart';
import 'package:taskify_app/widgets/login_button.dart';
import 'package:taskify_app/widgets/login_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Barcha maydonlarni to\'ldiring')));
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email noto\'g\'ri formatda')));
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Parol kamida 6 ta belgidan iborat bo\'lishi kerak!')));
      return;
    }

    print('Email: $email  ,   password: $password');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBase(
      backgroundColor: const Color.fromARGB(255, 240, 240, 247),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const IconLogo(),
            const SizedBox(height: 20),
            const Text(
              'Welcome back',
              style: TextStyle(
                  fontSize: 26,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1D2E)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sign in to manage your tasks.',
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 144, 148, 166)),
            ),
            const SizedBox(height: 20),
            LoginForm(
              hint: 'Email adress',
              icon: Icons.mail,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            LoginForm(
              hint: 'Password',
              icon: Icons.lock,
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 75, 138, 243),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const LoginButton(),
            const SizedBox(height: 20),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
