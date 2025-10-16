import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/DropDown/action_dropdown.dart';
import 'package:project_to_do_list/Components/DropDown/action_dropdown_view_model.dart';
import 'package:project_to_do_list/Components/DropDownItem/action_dropdown_item.dart';
import 'package:project_to_do_list/Components/DropDownItem/action_dropdown_item_view_model.dart';

import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/icons.dart';
import 'package:project_to_do_list/Shared/styles.dart';

class ActionDropdownPage extends StatelessWidget {
  const ActionDropdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ActionDropdownMenuItemViewModel(value: 1, label: "Tecnologia"),
      ActionDropdownMenuItemViewModel(value: 2, label: "Educação"),
      ActionDropdownMenuItemViewModel(value: 3, label: "Saúde"),
    ];

    return Scaffold(
    backgroundColor: brandBackground,
    appBar: AppBar(
      title: const Text('Estilos de Dropdown'),
      foregroundColor: textTitle,
      backgroundColor: neutralLightGray,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 25,
        children: [

          const Text('Primary', style: poppinsRegular24),

          ActionDropdown.instantiate<int>(
            viewModel: ActionDropdownViewModel<int>(
              items: items.map((vm) => ActionDropdownMenuItem.instantiate(viewModel: vm)).toList(),
              style: ActionDropdownStyle.primary,
              labelText: "Primary No Icon",
              hintText: "Selecione uma opção",
              onChanged: (val) => print("Selecionado: $val"),
            ),
          ),

          ActionDropdown.instantiate<int>(
            viewModel: ActionDropdownViewModel<int>(
              items: items.map((vm) => ActionDropdownMenuItem.instantiate(viewModel: vm)).toList(),
              style: ActionDropdownStyle.primary,
              labelText: "Primary With Icon",
              hintText: "Selecione uma opção",
              prefixIcon: AppIcons.list,
              onChanged: (val) => print("Selecionado: $val"),
            ),
          ),

          const Text('Secondary', style: poppinsRegular24),

          ActionDropdown.instantiate<int>(
              viewModel: ActionDropdownViewModel<int>(
                items: items.map((vm) => ActionDropdownMenuItem.instantiate(viewModel: vm)).toList(),
                style: ActionDropdownStyle.secondary,
                labelText: "Secondary No Icon",
                hintText: "Selecione uma opção",
                onChanged: (val) => print("Selecionado: $val"),
              ),
          ),

          ActionDropdown.instantiate<int>(
            viewModel: ActionDropdownViewModel<int>(
              items: items.map((vm) => ActionDropdownMenuItem.instantiate(viewModel: vm)).toList(),
              style: ActionDropdownStyle.secondary,
              labelText: "Secondary With Icon",
              hintText: "Selecione uma opção",
              prefixIcon: AppIcons.category,
              onChanged: (val) => print("Selecionado: $val"),
            ),
          ),

          const Text('Exemplos', style: poppinsRegular24),

          ActionDropdown.instantiate<int>(
            viewModel: ActionDropdownViewModel<int>(
              items: items.map((vm) => ActionDropdownMenuItem.instantiate(viewModel: vm)).toList(),
              style: ActionDropdownStyle.primary,
              labelText: "Categoria",
              hintText: "Escolha uma categoria",
              onChanged: (val) => print("Categoria: $val"),
              textColor: alternativeColor
            ),
          ),

          ActionDropdown.instantiate<int>(
            viewModel: ActionDropdownViewModel<int>(
              items: items.map((vm) => ActionDropdownMenuItem.instantiate(viewModel: vm)).toList(),
              style: ActionDropdownStyle.secondary,
              labelText: "Categoria Desabilitada",
              hintText: "Não editável",
              enabled: false,
            ),
          ),
        ],
      ),
    ),
  );
  }
}