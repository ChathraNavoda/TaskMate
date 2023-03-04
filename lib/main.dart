import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:taskmate/screens/add_tasks_screen.dart';
import 'package:taskmate/screens/auth/login.dart';
import 'package:taskmate/screens/update_screen.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskMate',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddTaskScreen(),
        '/update': (context) => const UpdateTaskScreen(),
        '/login': (context) => Login(),
      },
      initialRoute: '/login',
    );
  }
}
