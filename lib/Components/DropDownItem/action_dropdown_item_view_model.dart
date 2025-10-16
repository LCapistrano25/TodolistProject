import 'package:flutter/material.dart';

class ActionDropdownMenuItemViewModel<T> {
  final T value; // valor lógico que será retornado ao selecionar
  final String label; // texto exibido
  final IconData? icon; // ícone opcional
  final Color? textColor; // cor do texto
  final Color? iconColor; // cor do ícone

  ActionDropdownMenuItemViewModel({
    required this.value,
    required this.label,
    this.icon,
    this.textColor,
    this.iconColor,
  });
}
