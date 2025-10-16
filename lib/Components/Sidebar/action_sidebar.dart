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

  Color _getTextColor() {
    Color? color = black;

    switch(viewModel.style) {
      case ActionSidebarStyle.primary:
        color = black;
        break;
      case ActionSidebarStyle.secundary:
        color = brandWhite;
        break;
    }
    return color;
  }

  Color _getBackgroudColor() {
    Color? color = black;

    switch(viewModel.style) {
      case ActionSidebarStyle.primary:
          color = brandWhite;
          break;
      case ActionSidebarStyle.secundary:
          color = brandNeutralDark;
          break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _getBackgroudColor(),
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
              const SizedBox(height: 16),

              /// Título do menu
              RichText(
                text: TextSpan(
                  text: 'To do',
                  style: TextStyle(color: _getTextColor(), fontWeight: FontWeight.w900, fontSize: 18),
                  children: const <TextSpan>[
                    TextSpan(text: ' List', style: TextStyle(fontWeight: FontWeight.w900, color: primaryColor))
                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
