import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_to_do_list/Components/Inputs/action_input_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';

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

  Color _getBackgroundColor() {
    Color color;

    switch(viewModel.style) {
      case ActionInputStyle.primary:
        color = brandWhite;
        break;
      case ActionInputStyle.secondary:
        color = alternativeColor;
        break;
    }
    
    return color;
  }
  BorderSide _getBorder() {
    Color color;

    switch (viewModel.style) {
      case ActionInputStyle.primary:
        color = brandWhite;
        break;
      case ActionInputStyle.secondary:
        color = alternativeColor;
        break;
    }

    return BorderSide(
      color: viewModel.borderColor ?? color, // usa o borderColor custom se vier
      width: 1.5,
    );
  }

  Color _getTextColor() {
    Color color;

    switch(viewModel.style) {
      case ActionInputStyle.primary:
        color = textTitle;
        break;
      case ActionInputStyle.secondary:
        color = textSecondary;
        break;
    }

    return color;
  }

  Color _getIconColor() {
    Color color;

    switch(viewModel.style) {
      case ActionInputStyle.primary:
        color = textTitle;
        break;
      case ActionInputStyle.secondary:
        color = textSecondary;
        break;
    }

    return color;
  }

  List<TextInputFormatter> _getFormatters() {
      switch (viewModel.formatter) {
        case ActionTypeInputFormatter.digitsOnly:
          return [FilteringTextInputFormatter.digitsOnly];

        case ActionTypeInputFormatter.singleLine:
          return [FilteringTextInputFormatter.singleLineFormatter];

        case ActionTypeInputFormatter.lettersOnly:
          return [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          ];

        case ActionTypeInputFormatter.lettersAndDigits:
          return [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
          ];

        case ActionTypeInputFormatter.decimal:
          return [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ];

        case ActionTypeInputFormatter.decimal2Fixed:
          return [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d{0,2})?')),
          ];

        case ActionTypeInputFormatter.global:
          return []; // sem restrição
      }
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
      style: TextStyle(color: _getTextColor() ?? brandWhite),
      inputFormatters: _getFormatters(),
      decoration: InputDecoration(
        labelText: viewModel.labelText,
        labelStyle: TextStyle(color: _getTextColor()), // <- controla a cor do label
        hoverColor: _getBackgroundColor(), // <-- cor do hover no fundo

        hintText: viewModel.hintText,
        hintStyle: TextStyle(color: _getTextColor().withOpacity(0.6)), // <- cor do hint

        helperText: viewModel.helperText,
        helperStyle: TextStyle(color: _getTextColor().withOpacity(0.7)), // <- helper text

        errorText: viewModel.errorText,
        errorStyle: TextStyle(color:destructiveColor), // <- erro separado

        prefixIcon: viewModel.prefixIcon != null
            ? Icon(viewModel.prefixIcon, color: viewModel.iconColor ?? _getIconColor())
            : null,
        suffixIcon: viewModel.suffixIcon != null
            ? Icon(viewModel.suffixIcon, color: viewModel.iconColor ?? _getIconColor())
            : null,

        filled: true,
        fillColor: _getBackgroundColor(),

        enabledBorder: OutlineInputBorder(
          borderSide: _getBorder(),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: _getBorder(),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: _getBorder(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

}