import 'package:flutter/material.dart';

enum ActionButtonSize {
  iconOnlySmall,
  iconOnlyMedium,
  iconOnlyLarge,
  small,
  medium,
  large,
}

enum ActionButtonStyle {
  primary,
  secondary,
  destructive,
  disabled,
  empty,
}

class ActionButtonViewModel {
  final ActionButtonSize size;
  final ActionButtonStyle style;
  final String? text;
  final IconData? icon;
  final bool enabled;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;

  ActionButtonViewModel({
    required this.size,
    required this.style,
    this.text,
    this.icon,
    this.enabled = true,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.textColor,
  }) : assert(text != null || icon != null, 'ActionButtonViewModel deve ter pelo menos um texto ou um ícone.');
}