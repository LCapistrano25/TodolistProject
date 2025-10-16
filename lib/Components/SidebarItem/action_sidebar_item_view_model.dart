import 'package:flutter/material.dart';

enum ActionSidebarItemStyle {
  primary,
  secundary
}
class ActionSidebarItemViewModel {
  final ActionSidebarItemStyle style;
  final String label;
  final IconData icon;
  final bool isSelected;

  const ActionSidebarItemViewModel({
    required this.style,
    required this.label,
    required this.icon,
    this.isSelected = false,
  });

  /// Retorna uma cópia atualizada (copyWith pattern)
  ActionSidebarItemViewModel copyWith({
    ActionSidebarItemStyle? style,
    String? label,
    IconData? icon,
    bool? isSelected,
  }) {
    return ActionSidebarItemViewModel(
      style: style ?? this.style,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

