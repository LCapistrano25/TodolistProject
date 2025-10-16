import 'package:flutter/material.dart';

class ActionSidebarItemViewModel {
  final String label;
  final IconData icon;
  final bool isSelected;

  const ActionSidebarItemViewModel({
    required this.label,
    required this.icon,
    this.isSelected = false,
  });

  /// Retorna uma cópia atualizada (copyWith pattern)
  ActionSidebarItemViewModel copyWith({
    String? label,
    IconData? icon,
    bool? isSelected,
  }) {
    return ActionSidebarItemViewModel(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

