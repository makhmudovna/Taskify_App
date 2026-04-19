import 'package:flutter/material.dart';

class AppBase extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool safeArea;

  const AppBase({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? const Color(0xFFF5F6FA),
      appBar: appBar, // optional
      floatingActionButton: floatingActionButton,
      body: safeArea ? SafeArea(child: body) : body,
    );
  }
}
