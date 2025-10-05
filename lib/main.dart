import 'package:flutter/material.dart';
import 'package:project_to_do_list/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import 'package:project_to_do_list/Samples/actionInputSampleScreen/action_input_sample_screen.dart';
import 'package:project_to_do_list/Samples/homeScreen/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
