import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Components/Sidebar/action_sidebar.dart';
import 'package:project_to_do_list/Components/Sidebar/action_sidebar_view_model.dart';
import 'package:project_to_do_list/Components/SidebarItem/action_sidebar_item_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/icons.dart';

class ActionSidebarPage extends StatefulWidget {
  const ActionSidebarPage({super.key});

  @override
  State<ActionSidebarPage> createState() => _ActionSidebarPageState();
}

class _ActionSidebarPageState extends State<ActionSidebarPage>
    implements ActionSidebarDelegate, ActionButtonDelegate {
  late ActionSidebarViewModel sidebarVM;
  bool isSecondary = false; // controla qual tema aplicar

  @override
  void initState() {
    super.initState();
    _buildSidebarViewModel();
  }

  void _buildSidebarViewModel() {
    final style = isSecondary
        ? ActionSidebarItemStyle.secundary
        : ActionSidebarItemStyle.primary;

    sidebarVM = ActionSidebarViewModel(
      title: 'To do list',
      style: isSecondary
          ? ActionSidebarStyle.secundary
          : ActionSidebarStyle.primary,
      items: [
        ActionSidebarItemViewModel(
            style: style, label: 'Notas', icon: AppIcons.idea, isSelected: true),
        ActionSidebarItemViewModel(
            style: style, label: 'Criar lista', icon: AppIcons.add),
        ActionSidebarItemViewModel(
            style: style, label: 'Arquivo', icon: AppIcons.archive),
        ActionSidebarItemViewModel(
            style: style, label: 'Configurações', icon: AppIcons.settings),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Sidebar'),
        actions: [
          Row(
            children: [
              const Text("Secondary"),
              Switch(
                value: isSecondary,
                onChanged: (value) {
                  setState(() {
                    isSecondary = value;
                    _buildSidebarViewModel();
                  });
                },
              ),
            ],
          ),
        ],
      ),
      drawer: ActionSidebar.instantiate(
        viewModel: sidebarVM,
        delegate: this,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, // centraliza verticalmente
          crossAxisAlignment: CrossAxisAlignment.center, // centraliza horizontalmente
          children: [
            const Text(
              'Conteúdo principal',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22, // 👈 texto maior
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24), // espaçamento entre texto e botão
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: ActionButtonStyle.primary,
                size: ActionButtonSize.large,
                text: 'Voltar',
                textColor: brandWhite,
                icon: AppIcons.arrowBack,
              ),
              delegate: this,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onItemSelected(ActionSidebarItemViewModel item) {
    setState(() {
      sidebarVM = ActionSidebarViewModel(
        title: sidebarVM.title,
        style: sidebarVM.style,
        items: sidebarVM.items.map((i) {
          return i.label == item.label
              ? i.copyWith(isSelected: true)
              : i.copyWith(isSelected: false);
        }).toList(),
      );
    });
  }

  @override
  void onClick(ActionButtonViewModel viewModel) {
    Navigator.of(context).pop();
  }
}

