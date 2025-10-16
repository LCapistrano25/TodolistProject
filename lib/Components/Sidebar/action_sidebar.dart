import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/SidebarItem/action_sidebar_item.dart';
import 'package:project_to_do_list/Components/SidebarItem/action_sidebar_item_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Components/Sidebar/action_sidebar_view_model.dart';

abstract class ActionSidebarDelegate {
  void onItemSelected(ActionSidebarItemViewModel item);
}

class ActionSidebar extends StatelessWidget {
  final ActionSidebarViewModel viewModel;
  final ActionSidebarDelegate? delegate;

  const ActionSidebar._({
    super.key,
    required this.viewModel,
    this.delegate,
  });

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
      backgroundColor: brandWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Título do menu
              Text(
                viewModel.title,
                style: const TextStyle(
                  color: black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              /// Lista de Itens
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (_, index) {
                    final item = viewModel.items[index];
                    return ActionSidebarItem.instantiate(
                      viewModel: item,
                      onTap: (selectedItem) {
                        delegate?.onItemSelected(selectedItem);
                      },
                    );
                  },
                ),
              ),

              /// Rodapé opcional
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "v1.0.0",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
