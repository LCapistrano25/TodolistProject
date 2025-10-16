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

  Color _getSelectedItemColor(){
    Color color;
    switch(viewModel.style) {
        case ActionSidebarItemStyle.primary:
          color = brandBlueSoft;
          break;
        case ActionSidebarItemStyle.secundary:
          color = brandBlueDeep;
          break;
      }
      return color;
  }

  Color _getSelectTextItemColor(){
    Color color;
    switch(viewModel.style) {
        case ActionSidebarItemStyle.primary:
          color = brandBlueDarkAlt;
          break;
        case ActionSidebarItemStyle.secundary:
          color = brandBlueWhite;
          break;
      }
      return color;
  }

  Color _getTextItemColor(){
    Color color;
    switch(viewModel.style) {
        case ActionSidebarItemStyle.primary:
          color = black;
          break;
        case ActionSidebarItemStyle.secundary:
          color = brandWhite;
          break;
      }
      return color;
  }

  Color _getBackgroundItemColor(){
    Color color;
    switch(viewModel.style) {
        case ActionSidebarItemStyle.primary:
          color = brandWhite;
          break;
        case ActionSidebarItemStyle.secundary:
          color = brandNeutralDark;
          break;
      }
      return color;
  }

  @override
  Widget build(BuildContext context) {
    final bool selected = viewModel.isSelected;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: selected ? _getSelectedItemColor() : _getBackgroundItemColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: _getSelectedItemColor(),
        hoverColor: _getSelectedItemColor(),
        onTap: () => onTap?.call(viewModel),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                viewModel.icon,
                color: selected ? _getSelectTextItemColor() : _getTextItemColor(),
                size: 22,
              ),
              const SizedBox(width: 20),
              Text(
                viewModel.label,
                style: TextStyle(
                  color: selected ? _getSelectTextItemColor() : _getTextItemColor(),
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
