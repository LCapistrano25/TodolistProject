import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/SidebarItem/action_sidebar_item_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart'; // suas cores

class ActionSidebarItem extends StatelessWidget {
  final ActionSidebarItemViewModel viewModel;
  final void Function(ActionSidebarItemViewModel)? onTap;

  const ActionSidebarItem._({
    super.key,
    required this.viewModel,
    this.onTap,
  });

  static ActionSidebarItem instantiate({
    required ActionSidebarItemViewModel viewModel,
    void Function(ActionSidebarItemViewModel)? onTap,
  }) {
    return ActionSidebarItem._(
      viewModel: viewModel,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool selected = viewModel.isSelected;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: selected ? brandBlueSoft : brandWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: brandBlueSoft,
        hoverColor: brandBlueSoft,
        onTap: () => onTap?.call(viewModel),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                viewModel.icon,
                color: selected ? brandBlueDarkAlt : black,
                size: 22,
              ),
              const SizedBox(width: 20),
              Text(
                viewModel.label,
                style: TextStyle(
                  color: selected ? brandBlueDarkAlt : black,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
