import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Icons/action_icon_view_model.dart';

class ActionIcon extends StatelessWidget {
  final ActionIconViewModel viewModel;

  const ActionIcon._({
    super.key,
    required this.viewModel,
  });

  static ActionIcon instantiate({
    required ActionIconViewModel viewModel,
  }) {
    return ActionIcon._(
      viewModel: viewModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
        viewModel.icon,
        size: viewModel.size ?? 20,
        color: viewModel.color ?? Colors.black,
    );
  }
}
