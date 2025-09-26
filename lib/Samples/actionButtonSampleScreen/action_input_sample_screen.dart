import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Inputs/action_input.dart';
import 'package:project_to_do_list/Components/Inputs/action_input_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';

class ActionInputPage extends StatelessWidget {
  const ActionInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandBackground,
      appBar: AppBar(
        title: const Text('Estilos de Input'),
        foregroundColor: textTitle,
        backgroundColor: neutralLightGray,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ActionInput.instantiate(
            viewModel: ActionInputViewModel(
              style: ActionInputStyle.primary, // 🔹 use um dos estilos do enum
              labelText: "Nome",               // 🔹 só para testar
              hintText: "Digite seu nome",
            ),
          ),
        ),
      ),
    );
  }
}
