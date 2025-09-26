import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_to_do_list/Components/Inputs/action_input_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';

abstract class ActionInputDelegate {
  void onClick(ActionInputViewModel viewModel);
}

class ActionInput extends StatelessWidget {
  final ActionInputViewModel viewModel;
  final ActionInputDelegate? delegate;

  // Construtor privado, chamado pelo 'instantiate'
  const ActionInput._({
    super.key,
    required this.viewModel,
    this.delegate,
  });
  
  // Método estático para criar a instância do widget
  static ActionInput instantiate({
    required ActionInputViewModel viewModel,
    ActionInputDelegate? delegate,
  }) {
    return ActionInput._(
      viewModel: viewModel,
      delegate: delegate,
    );
  }

  BorderSide _getBorder() {
    Color color;

    switch (viewModel.style) {
      case ActionInputStyle.primary:
        color = brandWhite;
        break;
      case ActionInputStyle.secondary:
        color = black;
        break;
      case ActionInputStyle.error:
        color = destructiveColor;
        break;
      case ActionInputStyle.disabled:
        color = disabledColor;
        break;
    }

    return BorderSide(
      color: viewModel.borderColor ?? color, // usa o borderColor custom se vier
      width: 1.5,
    );
  }


   @override
  Widget build(BuildContext context) {
    return TextField(
      controller: viewModel.controller,
      readOnly: viewModel.readOnly,
      enabled: viewModel.enabled,
      obscureText: viewModel.obscureText,
      keyboardType: viewModel.keyboardType,
      textInputAction: viewModel.textInputAction,
      onChanged: viewModel.onChanged,
      onSubmitted: viewModel.onSubmitted,
      onTap: viewModel.onTap,
      style: TextStyle(color: viewModel.textColor ?? black),
      decoration: InputDecoration(
        labelText: viewModel.labelText,
        hintText: viewModel.hintText,
        helperText: viewModel.helperText,
        errorText: viewModel.errorText,
        prefixIcon: viewModel.prefixIcon != null
            ? Icon(viewModel.prefixIcon, color: viewModel.iconColor ?? black)
            : null,
        suffixIcon: viewModel.suffixIcon != null
            ? Icon(viewModel.suffixIcon, color: viewModel.iconColor ?? black)
            : null,
        filled: true,
        fillColor: viewModel.backgroundColor ?? brandWhite,
        enabledBorder: OutlineInputBorder(
          borderSide: _getBorder() ?? BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: _getBorder() ?? BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: _getBorder() ?? BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

}