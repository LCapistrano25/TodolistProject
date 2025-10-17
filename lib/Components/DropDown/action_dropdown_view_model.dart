import 'package:flutter/material.dart';

enum ActionDropdownStyle {
  primary,
  secondary,
}

class ActionDropDownItem<T> {
  final T value;
  final String label;
  final bool enabled;
  final bool isPlaceholder;

  const ActionDropDownItem({
    required this.value,
    required this.label,
    this.enabled = true,
    this.isPlaceholder = false,
  });
}

class ActionDropDownViewModel<T> {
  final ActionDropDownStyle style;
  final List<ActionDropDownItem<T>> items;
  final ValueNotifier<T?> controller;
  final bool enabled;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final Widget? icon;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? dropdownColor;
  final double? menuMaxHeight;

  const ActionDropDownViewModel({
    required this.style,
    required this.items,
    required this.controller,
    this.enabled = true,
    this.onChanged,
    this.hintText,
    this.icon,
    this.iconSize = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.borderRadius = 12,
    this.backgroundColor,
    this.borderColor,
    this.dropdownColor,
    this.menuMaxHeight,
  }) : assert(items.length > 0, 'ActionDropDownViewModel deve conter ao menos um item.');
}
