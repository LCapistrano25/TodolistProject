import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';

abstract class ActionButtonDelegate {
  void onClick(ActionButtonViewModel viewModel);
}

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;
  final ActionButtonDelegate? delegate;

  // Construtor privado, chamado pelo 'instantiate'
  const ActionButton._({
    super.key,
    required this.viewModel,
    this.delegate,
  });
  
  // Método estático para criar a instância do widget
  static ActionButton instantiate({
    required ActionButtonViewModel viewModel,
    ActionButtonDelegate? delegate,
  }) {
    return ActionButton._(
      viewModel: viewModel,
      delegate: delegate,
    );
  }

  bool get _isDisabled =>
      !viewModel.enabled || viewModel.style == ActionButtonStyle.disabled;

  // Helper para obter a cor de fundo com base no estilo
  Color _getBackgroundColor() {
    if (viewModel.backgroundColor != null) {
      return viewModel.backgroundColor!;
    }

    if (_isDisabled) {
      return viewModel.style == ActionButtonStyle.empty
          ? Colors.transparent
          : disabledColor;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        return primaryColor;
      case ActionButtonStyle.secondary:
        return neutralLightGray;
      case ActionButtonStyle.destructive:
        return destructiveColor;
      case ActionButtonStyle.disabled:
        return disabledColor;
      case ActionButtonStyle.empty:
        return Colors.transparent;
    }
  }

  // Helper para obter a cor do texto
  Color _getForegroundColor() {
    if (viewModel.textColor != null) {
      return viewModel.textColor!;
    }

    if (_isDisabled) {
      if (viewModel.style == ActionButtonStyle.empty) {
        return textDisabled;
      }

      return Colors.white;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        return textMain;
      case ActionButtonStyle.secondary:
        return textMain;
      case ActionButtonStyle.destructive:
        return Colors.white;
      case ActionButtonStyle.empty:
        return textMain;
      case ActionButtonStyle.disabled:
        return textMain;
    }
  }

  Color _getIconColor() {
    if (viewModel.iconColor != null) {
      return viewModel.iconColor!;
    }

    if (_isDisabled) {
      if (viewModel.style == ActionButtonStyle.empty) {
        return textDisabled;
      }

      return Colors.white;
    }

    switch (viewModel.style) {
      case ActionButtonStyle.destructive:
        return Colors.white;
      default:
        return _getForegroundColor();
    }
  }

  BorderSide? _getBorder() {
    Color? color = viewModel.borderColor;

    if (color == null) {
      if (viewModel.style == ActionButtonStyle.empty) {
        color = _isDisabled ? lightOutline : lightOutline;
      }
    }

    if (color == null) {
      return null;
    }

    return BorderSide(
      color: _isDisabled ? color.withOpacity(0.6) : color,
      width: 1.5,
    );
  }

  // Helper para obter o tamanho do ícone com base no tamanho do botão
  double _getIconSize() {
    switch (viewModel.size) {
      case ActionButtonSize.iconOnlySmall:
        return 16.0;
      case ActionButtonSize.iconOnlyMedium:
        return 20.0;
      case ActionButtonSize.iconOnlyLarge:
        return 24.0;
      case ActionButtonSize.small:
        return 16.0;
      case ActionButtonSize.medium:
        return 20.0;
      case ActionButtonSize.large:
        return 24.0;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (viewModel.size) {
      case ActionButtonSize.iconOnlySmall:
        return const EdgeInsets.all(8.0);
      case ActionButtonSize.iconOnlyMedium:
        return const EdgeInsets.all(12.0);
      case ActionButtonSize.iconOnlyLarge:
        return const EdgeInsets.all(16.0);
      case ActionButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
      case ActionButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 20);
      case ActionButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 24);
    }
  }

  Size? _getFixedSize() {
    switch (viewModel.size) {
      case ActionButtonSize.iconOnlySmall:
        return const Size.square(40);
      case ActionButtonSize.iconOnlyMedium:
        return const Size.square(48);
      case ActionButtonSize.iconOnlyLarge:
        return const Size.square(56);
      default:
        return null;
    }
  }

  Size _getMinimumSize() {
    switch (viewModel.size) {
      case ActionButtonSize.small:
        return const Size(64, 40);
      case ActionButtonSize.medium:
        return const Size(72, 48);
      case ActionButtonSize.large:
        return const Size(80, 56);
      case ActionButtonSize.iconOnlySmall:
        return const Size.square(40);
      case ActionButtonSize.iconOnlyMedium:
        return const Size.square(48);
      case ActionButtonSize.iconOnlyLarge:
        return const Size.square(56);
    }
  }

  TextStyle _getTextStyle() {
    switch (viewModel.size) {
      case ActionButtonSize.small:
        return poppinsRegular12;
      case ActionButtonSize.medium:
        return poppinsRegular14;
      case ActionButtonSize.large:
        return poppinsRegular16;
      case ActionButtonSize.iconOnlySmall:
      case ActionButtonSize.iconOnlyMedium:
      case ActionButtonSize.iconOnlyLarge:
        return poppinsRegular14;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if (viewModel.icon != null) {
      children.add(
        Icon(
          viewModel.icon,
          size: _getIconSize(),
          color: _getIconColor(),
        ),
      );
    }

    if (viewModel.icon != null && viewModel.text != null) {
      children.add(const SizedBox(width: 8.0));
    }

    if (viewModel.text != null) {
      children.add(
        Text(
          viewModel.text!,
          style: _getTextStyle().copyWith(color: _getForegroundColor()),
        ),
      );
    }

    return ElevatedButton(
      onPressed: _isDisabled ? null : () => delegate?.onClick(viewModel),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: _getBackgroundColor(),
        disabledBackgroundColor:
            viewModel.style == ActionButtonStyle.empty ? Colors.transparent : disabledColor,
        foregroundColor: _getForegroundColor(),
        disabledForegroundColor: _getForegroundColor(),
        textStyle: _getTextStyle().copyWith(color: _getForegroundColor()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: _getBorder() ?? BorderSide.none,
        ),
        padding: _getPadding(),
        minimumSize: _getMinimumSize(),
        fixedSize: _getFixedSize(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}