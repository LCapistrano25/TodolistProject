import 'package:flutter/material.dart';

enum ActionSidebarStyle {
  primay,
  secundary
}

class ActionSidebarViewModel {
  ActionSidebarStyle style;

  ActionSidebarViewModel(
    {required this.style}
  );

}