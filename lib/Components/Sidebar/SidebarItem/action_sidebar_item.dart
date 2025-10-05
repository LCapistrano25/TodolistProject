
import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Sidebar/SidebarItem/action_sidebar_item_view_model.dart';

class ActionSidebarItem extends StatelessWidget {
  final ActionSidebarItemViewModel viewModel;

  ActionSidebarItem._({
    required this.viewModel
  });

  static ActionSidebarItem instantiate({
    required ActionSidebarItemViewModel viewModel
  }) {
    return ActionSidebarItem._(
      viewModel: viewModel
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}