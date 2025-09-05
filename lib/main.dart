import 'package:flutter/material.dart';
import 'package:project_to_do_list/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';


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
      home: const ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(context, 'Tipos de Botões', ActionButtonPage()),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context, String text, Widget scene) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => scene),
        );
      },
      child: Text(text),
    );
  }
}
