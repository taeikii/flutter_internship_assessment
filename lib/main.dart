import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/task_provider.dart';
import 'screens/home_screen.dart';
import 'screens/create_task_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bertugas - Task Management',
      debugShowCheckedModeBanner: false,
      theme: appTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/create': (context) => const CreateTaskScreen(),
      },
    );
  }
}