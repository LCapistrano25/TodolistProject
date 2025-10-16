import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Components/Cards/CardAddItem/action_card_add_item.dart';
import 'package:project_to_do_list/Components/Cards/CardAddItem/action_card_add_item_view_model.dart';

/// Página de exemplo para visualizar o componente CardAddItem
class CardAddItemPage extends StatefulWidget {
  const CardAddItemPage({super.key});

  @override
  State<CardAddItemPage> createState() => _CardAddItemPageState();
}

class _CardAddItemPageState extends State<CardAddItemPage>
    implements ActionButtonDelegate {
  bool isSecondary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo CardAddItem'),
        actions: [
          Row(
            children: [
              const Text("Secondary"),
              Switch(
                value: isSecondary,
                onChanged: (value) {
                  setState(() {
                    isSecondary = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: CardAddItem.instantiate(
          style: isSecondary
              ? CardAddItemStyle.secondary
              : CardAddItemStyle.primary,
          onAddPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item adicionado!')),
            );
          },
        ),
      ),
    );
  }

  @override
  void onClick(ActionButtonViewModel viewModel) {
    Navigator.of(context).pop();
  }
}
