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

  // Helper para obter a cor de fundo com base no estilo
  Color _getBackgroundColor() {
    switch (viewModel.style) {
      case ActionButtonStyle.primary:
        return primaryColor;
      case ActionButtonStyle.secondary:
        return secondaryColor;
      case ActionButtonStyle.destructive:
        return destructiveColor;
      case ActionButtonStyle.disabled:
        return disabledColor;
      case ActionButtonStyle.empty:
        return emptyColor;
    }
  }

  // Helper para obter a cor do texto/ícone
  Color _getForegroundColor() {
    if (viewModel.style == ActionButtonStyle.disabled) {
        return textMain;
    }

    if (viewModel.style == ActionButtonStyle.empty) {
        return textMain;
    }

    return Colors.white;
  }

  // Helper para obter o tamanho do ícone com base no tamanho do botão
  // Tamanho do ícone conforme tipo
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
  
  // Helper para obter o padding com base no tamanho do botão
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
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 24);
      case ActionButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 32);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if (viewModel.icon != null) {
      children.add(Icon(viewModel.icon, size: _getIconSize()));
    }

    if (viewModel.icon != null && viewModel.text != null) {
      children.add(const SizedBox(width: 8.0));
    }

    if (viewModel.text != null) {
      children.add(Text(viewModel.text!));
    }
    
    return ElevatedButton(
      onPressed: (viewModel.style == ActionButtonStyle.disabled || !viewModel.enabled)
          ? null
          : () => delegate?.onClick(viewModel),
      style: ElevatedButton.styleFrom(
        backgroundColor: _getBackgroundColor(),
        foregroundColor: _getForegroundColor(),
        textStyle: poppinsRegular14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: _getPadding(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}