import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/pages/home_page.dart';
import 'package:taskify_app/providers/theme_provider.dart';
import 'package:taskify_app/widgets/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('task');
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 247),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1D2E),
        cardColor: const Color(0xFF2A2D3E),
        hintColor: const Color(0xFF6B7A99),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // ✅
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Taskfiy App',
      home: const HomePage(),
    );
  }
}
