import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';


class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estilos de Botões'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Primary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.large,
                        style: ActionButtonStyle.primary,
                        text: 'Large',
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.primary,
                        text: 'Medium',
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.primary,
                        text: 'Small',
                      )
                    ),
                                        const SizedBox(height: 10,),

                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.large,
                        style: ActionButtonStyle.primary,
                        text: 'Large',
                        icon: Icons.add,
                      )
                    ),
                  ],
                ),
                Column(
                  children: [
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.large,
                        style: ActionButtonStyle.secondary,
                        text: 'Large',
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.secondary,
                        text: 'Medium',
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.secondary,
                        text: 'Small',
                      )
                    ),
                  ],
                ),
                Column(
                  children: [
                    ActionButton.instantiate(
                      viewModel: ActionButtonViewModel(
                        size: ActionButtonSize.large,
                        style: ActionButtonStyle.tertiary,
                        text: 'Large',
                        textColor: textMain
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(
                      viewModel: ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.tertiary,
                        text: 'Medium',
                        textColor: textMain
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(
                      viewModel: ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.tertiary,
                        text: 'Small',
                        textColor: textMain
                      )
                    ),
                  ],
                ),

                Column(
                  children: [
                    ActionButton.instantiate(
                      viewModel: ActionButtonViewModel(
                        size: ActionButtonSize.large,
                        style: ActionButtonStyle.destructive,
                        text: 'Large',
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(
                      viewModel: ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.destructive,
                        text: 'Medium',
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(
                      viewModel: ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.destructive,
                        text: 'Small',
                      )
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20,),
            const Text(
              'Secundary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            
          ],
        ),
      )
    );
  }
}