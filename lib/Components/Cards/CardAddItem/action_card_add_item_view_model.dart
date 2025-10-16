import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Components/Dropdown/action_dropdown_view_model.dart';
import 'package:project_to_do_list/Components/Inputs/action_input_view_model.dart';

enum CardAddItemStyle { primary, secondary }

class CardAddItemViewModel {
  final CardAddItemStyle style;
  final ActionInputViewModel nameInput;
  final ActionDropdownViewModel<String> typeDropdown;
  final ActionInputViewModel valueInput;
  final ActionButtonViewModel addButton;
  final VoidCallback? onAddPressed;

  CardAddItemViewModel({
    required this.style,
    required this.nameInput,
    required this.typeDropdown,
    required this.valueInput,
    required this.addButton,
    this.onAddPressed,
  });
}
