import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';
import 'package:project_to_do_list/Components/Sidebar/action_sidebar_view_model.dart';

abstract class ActionSidebarDelegate {
    void onItemSelected(ActionSidebarViewModel viewModel);
}

class ActionSidebar extends StatelessWidget {
  final ActionSidebarViewModel viewModel;
  final ActionSidebarDelegate? delegate;

  // Construtor privado, chamado pelo 'instantiate'
  const ActionSidebar._({
    super.key,
    required this.viewModel,
    this.delegate,
  });
  
  // Método estático para criar a instância do widget
  static ActionSidebar instantiate({
    required ActionSidebarViewModel viewModel,
    ActionSidebarDelegate? delegate,
  }) {
    return ActionSidebar._(
      viewModel: viewModel,
      delegate: delegate,
    );
  }

   @override
  Widget build(BuildContext context) {
      return Drawer(
      backgroundColor: black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column()
    );
  }

}