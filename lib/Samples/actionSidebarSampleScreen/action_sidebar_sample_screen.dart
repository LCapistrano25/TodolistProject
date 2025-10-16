import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Sidebar/action_sidebar.dart';
import 'package:project_to_do_list/Components/Sidebar/action_sidebar_view_model.dart';
import 'package:project_to_do_list/Components/SidebarItem/action_sidebar_item_view_model.dart';
import 'package:project_to_do_list/Shared/icons.dart';
class ActionSidebarPage extends StatefulWidget {
  const ActionSidebarPage({super.key});

  @override
  State<ActionSidebarPage> createState() => _ActionSidebarPageState();
}

class _ActionSidebarPageState extends State<ActionSidebarPage> implements ActionSidebarDelegate {
  late ActionSidebarViewModel sidebarVM;

  @override
  void initState() {
    super.initState();
    sidebarVM = ActionSidebarViewModel(
      title: 'To do list',
      style: ActionSidebarStyle.primary,
      items: [
        ActionSidebarItemViewModel(label: 'Notas', icon: AppIcons.idea, isSelected: true),
        ActionSidebarItemViewModel(label: 'Criar lista', icon: AppIcons.add),
        ActionSidebarItemViewModel(label: 'Arquivo', icon: AppIcons.archive),
        ActionSidebarItemViewModel(label: 'Configurações', icon: AppIcons.settings),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo Sidebar')),
      drawer: ActionSidebar.instantiate(
        viewModel: sidebarVM,
        delegate: this,
      ),
      body: const Center(child: Text('Conteúdo principal')),
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
}
