import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';


abstract class ActionButtonDelegate {
  void onClick(ActionButtonViewModel viewModel);
}
class ActionButton extends StatelessWidget {
  
  final ActionButtonViewModel viewModel;
  Color backgroundColor;
  int size = 16;
  Color textColor = Colors.white;
  ActionButtonDelegate? delegate;
  IconData? icon;
  
  ActionButton._(
    {
      super.key, 
      required this.viewModel, 
      this.backgroundColor = primaryColor,
      this.size = 16,
      this.textColor = Colors.white,
      this.icon
    });

   static ActionButton instantiate({
    required ActionButtonViewModel viewModel, 
    backgroundColor = primaryColor
    }) {
    return ActionButton._(viewModel: viewModel);
  }

  void setStyle(ActionButtonStyle style) {
    switch(viewModel.style) {
      case ActionButtonStyle.primary:
        backgroundColor = primaryColor;
        this.textColor = Colors.white;
        break;

      case ActionButtonStyle.secondary:
        backgroundColor = secondaryColor;
        this.textColor = Colors.white;
        break;

      case ActionButtonStyle.tertiary:
        backgroundColor = disabledColor;
        this.textColor = textMain;
        break;

      case ActionButtonStyle.destructive:
        backgroundColor = destructiveColor;
        this.textColor = Colors.white;
        break;
      
      case ActionButtonStyle.disabled:
        backgroundColor = disabledColor;
        this.textColor = Colors.white;
        break;
    }
  }

  void setSize(ActionButtonSize size) {
    switch(viewModel.size) {
      case ActionButtonSize.small:
        this.size = 16;
        break;

      case ActionButtonSize.medium:
        this.size = 24;
        break;

      case ActionButtonSize.large:
        this.size = 32;
        break;
    }
  }

  Widget createElevatedButton() {
    double verticalPadding = 12.0;
    double horizontalPadding = 32.0;

    return ElevatedButton(
      onPressed: () { delegate?.onClick(viewModel); },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        textStyle: poppinsRegular14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      ),
      child: Text(viewModel.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    setStyle(viewModel.style);
    setSize(viewModel.size);
    return createElevatedButton();
    
  }
}