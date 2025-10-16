import 'package:flutter/material.dart';
import 'package:project_to_do_list/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import 'package:project_to_do_list/Samples/actionDropDownSampleScren/action_dropdown_sample_screen.dart';
import 'package:project_to_do_list/Samples/actionInputSampleScreen/action_input_sample_screen.dart';
import 'package:project_to_do_list/Samples/actionSidebarSampleScreen/action_sidebar_sample_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              _buildButton(context, 'Tipos de Input', ActionInputPage()),
              _buildButton(context, 'Tipos de Sidebar', ActionSidebarPage()),
              _buildButton(context, 'Tipos de Dropdown', ActionDropdownPage())
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
