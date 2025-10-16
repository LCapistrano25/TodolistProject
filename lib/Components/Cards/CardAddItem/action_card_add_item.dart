import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Components/Cards/CardAddItem/action_card_add_item_view_model.dart';
import 'package:project_to_do_list/Components/Dropdown/action_dropdown.dart';
import 'package:project_to_do_list/Components/Dropdown/action_dropdown_view_model.dart';
import 'package:project_to_do_list/Components/Inputs/action_input.dart';
import 'package:project_to_do_list/Components/Inputs/action_input_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/icons.dart';

class CardAddItem extends StatelessWidget {
  final CardAddItemViewModel viewModel;

  const CardAddItem({
    super.key,
    required this.viewModel,
  });

  /// Factory padrão para criação do Card (seguindo o padrão dos outros componentes)
  static Widget instantiate({
    required CardAddItemStyle style,
    VoidCallback? onAddPressed,
  }) {
    final isSecondary = style == CardAddItemStyle.secondary;

    final viewModel = CardAddItemViewModel(
      style: style,
      onAddPressed: onAddPressed,
      nameInput: ActionInputViewModel(
        labelText: 'Nome item',
        style:
            ActionInputStyle.primary,
        borderColor: isSecondary
            ? brandWhite
            : textSecondary,
      ),
      typeDropdown: ActionDropdownViewModel<String>(
        labelText: 'Tipo de Item',
        style: 
            ActionDropdownStyle.primary,
        items: [],
        borderColor: isSecondary
            ? brandWhite
            : textSecondary,
      ),
      valueInput: ActionInputViewModel(
        labelText: 'Valor',
        prefixIcon: AppIcons.dollar,
        formatter: ActionTypeInputFormatter.decimal2Fixed,
        style:
             ActionInputStyle.primary,
        borderColor: isSecondary
            ? brandWhite
            : textSecondary,
        iconColor: isSecondary
            ? black
            : textSecondary,
      ),
      addButton: ActionButtonViewModel(
        text: 'Adicionar',
        textColor: brandWhite,
        style: isSecondary
            ? ActionButtonStyle.secondary
            : ActionButtonStyle.primary,
        size: ActionButtonSize.large,
      ),
    );

    return CardAddItem(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final isSecondary = viewModel.style == CardAddItemStyle.secondary;

    return Container(
      width: 600,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isSecondary ? alternativeColor : brandWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ajusta ao conteúdo interno
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            'Adicionar item',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isSecondary ? brandWhite : textSecondary,
            ),
          ),

          const SizedBox(height: 24),

          // Campo: Nome do item
          ActionInput.instantiate(viewModel: viewModel.nameInput),

          const SizedBox(height: 16),

          // Campo: Tipo de item
          ActionDropdown.instantiate(viewModel: viewModel.typeDropdown),

          const SizedBox(height: 16),

          // Campo: Valor
          ActionInput.instantiate(viewModel: viewModel.valueInput),

          const SizedBox(height: 24),

          // Botão: Adicionar
          Center(
            child: ActionButton.instantiate(
              viewModel: viewModel.addButton,
              delegate: _CardAddItemDelegate(
                onPressed: viewModel.onAddPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardAddItemDelegate implements ActionButtonDelegate {
  final VoidCallback? onPressed;

  const _CardAddItemDelegate({this.onPressed});

  @override
  void onClick(ActionButtonViewModel viewModel) {
    onPressed?.call();
  }
}
