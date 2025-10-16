import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/DropDown/action_dropdown_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';

abstract class ActionDropDownDelegate<T> {
  void onChanged(ActionDropDownViewModel<T> viewModel, T? value);
}

class ActionDropDown<T> extends StatelessWidget {
  final ActionDropDownViewModel<T> viewModel;
  final ActionDropDownDelegate<T>? delegate;

  const ActionDropDown._({
    super.key,
    required this.viewModel,
    this.delegate,
  });

  static ActionDropDown<T> instantiate({
    required ActionDropDownViewModel<T> viewModel,
    ActionDropDownDelegate<T>? delegate,
  }) {
    return ActionDropDown._(
      viewModel: viewModel,
      delegate: delegate,
    );
  }

  Color _backgroundColor() {
    if (viewModel.backgroundColor != null) {
      return viewModel.backgroundColor!;
    }

    switch (viewModel.style) {
      case ActionDropDownStyle.primary:
        return brandWhite;
      case ActionDropDownStyle.secondary:
        return alternativeColor;
    }
  }

  Color _borderColor() {
    if (viewModel.borderColor != null) {
      return viewModel.borderColor!;
    }

    switch (viewModel.style) {
      case ActionDropDownStyle.primary:
        return lightOutline;
      case ActionDropDownStyle.secondary:
        return alternativeColor;
    }
  }

  Color _dropdownColor() {
    if (viewModel.dropdownColor != null) {
      return viewModel.dropdownColor!;
    }

    switch (viewModel.style) {
      case ActionDropDownStyle.primary:
        return brandWhite;
      case ActionDropDownStyle.secondary:
        return brandWhite;
    }
  }

  Color _iconColor(bool enabled) {
    if (!enabled) {
      return textDisabled;
    }

    switch (viewModel.style) {
      case ActionDropDownStyle.primary:
        return textTitle;
      case ActionDropDownStyle.secondary:
        return textSecondary;
    }
  }

  TextStyle _menuItemTextStyle(ActionDropDownItem<T> item) {
    final bool isPlaceholder = item.isPlaceholder || !item.enabled;

    if (isPlaceholder) {
      return poppinsRegular14.copyWith(color: textSecondary);
    }

    switch (viewModel.style) {
      case ActionDropDownStyle.primary:
        return poppinsRegular14.copyWith(color: textMain);
      case ActionDropDownStyle.secondary:
        return poppinsRegular14.copyWith(color: textMain);
    }
  }

  TextStyle _selectedTextStyle() {
    switch (viewModel.style) {
      case ActionDropDownStyle.primary:
        return poppinsRegular14.copyWith(color: textTitle);
      case ActionDropDownStyle.secondary:
        return poppinsRegular14.copyWith(color: textMain);
    }
  }

  TextStyle _hintTextStyle() {
    return poppinsRegular14.copyWith(color: textSecondary);
  }

  List<DropdownMenuItem<T>> _buildItems() {
    return viewModel.items
        .map(
          (item) => DropdownMenuItem<T>(
            value: item.value,
            enabled: item.enabled,
            child: Text(
              item.label,
              style: _menuItemTextStyle(item),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildSelectedItems() {
    return viewModel.items
        .map(
          (item) => Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              item.label,
              style: _menuItemTextStyle(item),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T?>(
      valueListenable: viewModel.controller,
      builder: (context, value, _) {
        final items = _buildItems();
        final selectedBuilder = _buildSelectedItems();
        final bool hasSelectedValue =
            viewModel.items.any((item) => item.value == value);
        final T? effectiveValue = hasSelectedValue ? value : null;

        final Widget dropdown = DropdownButton<T>(
          value: effectiveValue,
          isExpanded: true,
          hint: viewModel.hintText != null
              ? Text(
                  viewModel.hintText!,
                  style: _hintTextStyle(),
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          items: items,
          selectedItemBuilder: (_) => selectedBuilder,
          onChanged: !viewModel.enabled
              ? null
              : (newValue) {
                  viewModel.controller.value = newValue;
                  viewModel.onChanged?.call(newValue);
                  delegate?.onChanged(viewModel, newValue);
                },
          icon: viewModel.icon ??
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: viewModel.iconSize,
                color: _iconColor(viewModel.enabled),
              ),
          iconEnabledColor: _iconColor(true),
          iconDisabledColor: _iconColor(false),
          style: _selectedTextStyle(),
          dropdownColor: _dropdownColor(),
          menuMaxHeight: viewModel.menuMaxHeight,
          underline: const SizedBox.shrink(),
        );

        return DecoratedBox(
          decoration: BoxDecoration(
            color: _backgroundColor(),
            borderRadius: BorderRadius.circular(viewModel.borderRadius),
            border: Border.all(
              color: _borderColor(),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: viewModel.padding,
            child: dropdown,
          ),
        );
      },
    );
  }
}
