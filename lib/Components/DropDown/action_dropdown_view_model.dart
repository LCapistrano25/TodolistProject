import 'package:flutter/material.dart';

enum ActionDropdownStyle {
  primary,
  secondary,
}

class ActionDropdownViewModel<T> {
  final ActionDropdownStyle style;

  final List<DropdownMenuItem<T>> items;
  final T? value;

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;

  final bool enabled;
  final bool readOnly;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final ValueChanged<T?>? onChanged;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;

  /// 🔹 Nova propriedade para controlar a cor do menu suspenso
  final Color? dropdownColor;

  ActionDropdownViewModel({
    required this.style,
    required this.items,
    this.value,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.dropdownColor,
  });
}
