import 'package:flutter/material.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'action_dropdown_view_model.dart';

class ActionDropdown<T> extends StatelessWidget {
  final ActionDropdownViewModel<T> viewModel;

  const ActionDropdown._({
    super.key,
    required this.viewModel,
  });

  static ActionDropdown<T> instantiate<T>({
    required ActionDropdownViewModel<T> viewModel,
  }) {
    return ActionDropdown._(viewModel: viewModel);
  }

  Color _getBackgroundColor() {

    switch (viewModel.style) {
      case ActionDropdownStyle.primary:
        return brandWhite;
      case ActionDropdownStyle.secondary:
        return alternativeColor;
    }
  }

  BorderSide _getBorder() {
    Color color;
    switch (viewModel.style) {
      case ActionDropdownStyle.primary:
        color = brandWhite;
        break;
      case ActionDropdownStyle.secondary:
        color = alternativeColor;
        break;
    }
    return BorderSide(
      color: viewModel.borderColor ?? color,
      width: 1.5,
    );
  }

  Color _getTextColor() {
    Color color;

    switch (viewModel.style) {
      case ActionDropdownStyle.primary:
        color = viewModel.textColor ?? textTitle;
        return color;
      case ActionDropdownStyle.secondary:
        color = viewModel.textColor ?? textSecondary;
        return color;
    }
  }

  Color _getIconColor() {
    if (viewModel.iconColor != null) return viewModel.iconColor!;
    switch (viewModel.style) {
      case ActionDropdownStyle.primary:
        return textTitle;
      case ActionDropdownStyle.secondary:
        return textSecondary;
    }
  }

  Color _getHintColor() {
  switch (viewModel.style) {
    case ActionDropdownStyle.primary:
      return textSecondary.withOpacity(0.6);
    case ActionDropdownStyle.secondary:
      return textSecondary.withOpacity(0.4); // cinza mais suave
  }
}


  @override
  Widget build(BuildContext context) {
    final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    return DropdownButtonFormField<T>(
      value: viewModel.value,
      items: viewModel.items,
      onChanged: viewModel.readOnly || !viewModel.enabled ? null : viewModel.onChanged,

      dropdownColor: _getBackgroundColor(),

      decoration: InputDecoration(
        labelText: viewModel.labelText,
        labelStyle: TextStyle(color: _getTextColor()),
        floatingLabelStyle: TextStyle(color: _getTextColor()),

        hintText: viewModel.hintText,
        hintStyle: TextStyle(color: _getHintColor()),

        helperText: viewModel.helperText,
        helperStyle: TextStyle(color: _getTextColor()),

        errorText: viewModel.errorText,
        errorStyle: const TextStyle(color: destructiveColor),

        prefixIcon: viewModel.prefixIcon != null
            ? Icon(viewModel.prefixIcon, color: _getIconColor())
            : null,
        suffixIcon: viewModel.suffixIcon != null
            ? Icon(viewModel.suffixIcon, color: _getIconColor())
            : null,

        filled: true,
        fillColor: _getBackgroundColor() ?? scaffoldBg,

        enabledBorder: OutlineInputBorder(
          borderSide: _getBorder(),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: _getBorder(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      style: TextStyle(
        color: _getTextColor(), // 🔹 valor selecionado
      ),

      iconEnabledColor: _getIconColor(),
    );
  }
}
