
import 'package:flutter/material.dart';

class ActionSidebarItemViewModel {
  final String label;
  final IconData icon;
  final String route; // opcional: rota de navegação

  ActionSidebarItemViewModel({
    required this.label,
    required this.icon,
    required this.route,
  });
}
