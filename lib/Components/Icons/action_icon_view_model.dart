import 'package:flutter/material.dart';

class ActionIconViewModel {
  final IconData icon; // ✅ Corrigido: agora aceita AppIcons.*
  final Color? color;
  final double? size;

  const ActionIconViewModel({
    required this.icon,
    this.color,
    this.size,
  });
}
