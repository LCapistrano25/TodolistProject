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
        child: Column(
          spacing: 25,
          children: [

            const Text('Primary', style: poppinsRegular24),
            
            ActionInput.instantiate(
              viewModel: ActionInputViewModel(
                style: ActionInputStyle.primary, // 🔹 use um dos estilos do enum
                labelText: "Primary No Icon",               // 🔹 só para testar
                hintText: "Digite seu nome",
              )
            ),

            ActionInput.instantiate(
              viewModel: ActionInputViewModel(
                style: ActionInputStyle.primary, // 🔹 use um dos estilos do enum
                labelText: "Primary With Icon",               // 🔹 só para testar
                hintText: "Digite seu nome",
                prefixIcon: Icons.search
                )
            ),

            const Text('Secondary', style: poppinsRegular24),

            ActionInput.instantiate(
              viewModel: ActionInputViewModel(
                style: ActionInputStyle.secondary, // 🔹 use um dos estilos do enum
                labelText: "Secundary No Icon",               // 🔹 só para testar
                hintText: "Digite seu nome")
            ),

            ActionInput.instantiate(
              viewModel: ActionInputViewModel(
                style: ActionInputStyle.secondary, // 🔹 use um dos estilos do enum
                labelText: "Secundary With Icon",               // 🔹 só para testar
                hintText: "Digite seu nome",
                prefixIcon: Icons.search
              )
            ),
          ]
        ),
      )
    );
  }
}
