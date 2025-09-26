import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
import 'package:project_to_do_list/Shared/colors.dart';
import 'package:project_to_do_list/Shared/styles.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandBackground,
      appBar: AppBar(title: const Text('Estilos de Botões'), foregroundColor: textTitle, backgroundColor: neutralLightGray,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: brandWhite,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Buttons', style: poppinsRegular24),
                    const SizedBox(height: 32),
                    ScrollConfiguration(
                      behavior: _NoGlow(), // sem const
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicWidth(
                          child: _ButtonsTable(), // sem const
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonsTable extends StatelessWidget {
  static final List<_ButtonVariant> _primaryVariants = [
    _ButtonVariant(
      label: 'Primary',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.primary,
        text: 'Label',
        textColor: brandWhite
      ),
    ),
    _ButtonVariant(
      label: 'Secondary',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.secondary,
        text: 'Label',
        textColor: brandWhite
      ),
    ),
    _ButtonVariant(
      label: 'Destructive',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.destructive,
        text: 'Label',
      ),
    ),
    _ButtonVariant(
      label: 'Disabled',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.disabled,
        text: 'Label',
        textColor: textMain,
        enabled: false,
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Primary',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.primary,
        icon: Icons.add,
        iconColor: brandWhite
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Secundary',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.secondary,
        icon: Icons.add,
        iconColor: brandWhite
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Destructive',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.destructive,
        icon: Icons.add,
        iconColor: brandWhite
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Disabled',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.disabled,
        icon: Icons.add,
        iconColor: textMain
      ),
    ),
  ];

  static final List<_ButtonVariant> _secondaryVariants = [
    _ButtonVariant(
      label: 'Primary',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.empty,
        text: 'Label',
        textColor: primaryColor,
        iconColor: primaryColor,
        borderColor: primaryColor,
      ),
    ),
    _ButtonVariant(
      label: 'Secundary',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.empty,
        text: 'Label',
        textColor: secondaryColor,
        iconColor: secondaryColor,
        borderColor: secondaryColor,
      ),
    ),
    _ButtonVariant(
      label: 'Destructive',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.empty,
        text: 'Label',
        textColor: destructiveColor,
        iconColor: destructiveColor,
        borderColor: destructiveColor,
      ),
    ),
    _ButtonVariant(
      label: 'Destructive',
      builder: (size) => ActionButtonViewModel(
        size: size,
        style: ActionButtonStyle.empty,
        text: 'Label',
        textColor: disabledColor,
        iconColor: disabledColor,
        borderColor: disabledColor,
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Primary',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.empty,
        icon: Icons.add,
        iconColor: primaryColor,
        borderColor: primaryColor,
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Secundary',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.empty,
        icon: Icons.add,
        iconColor: secondaryColor,
        borderColor: secondaryColor,
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Destructive',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.empty,
        icon: Icons.add,
        iconColor: destructiveColor,
        borderColor: destructiveColor,
      ),
    ),
    _ButtonVariant(
      label: 'Icon Only Disabled',
      builder: (size) => ActionButtonViewModel(
        size: _iconOnlySize(size),
        style: ActionButtonStyle.empty,
        icon: Icons.add,
        iconColor: disabledColor,
        borderColor: disabledColor,
      ),
    ),
  ];

  const _ButtonsTable();

  static ActionButtonSize _iconOnlySize(ActionButtonSize size) {
    switch (size) {
      case ActionButtonSize.large:
      case ActionButtonSize.iconOnlyLarge:
        return ActionButtonSize.iconOnlyLarge;
      case ActionButtonSize.medium:
      case ActionButtonSize.iconOnlyMedium:
        return ActionButtonSize.iconOnlyMedium;
      case ActionButtonSize.small:
      case ActionButtonSize.iconOnlySmall:
        return ActionButtonSize.iconOnlySmall;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            SizedBox(width: 280),
            _SectionHeading(title: 'Primary'),
            SizedBox(width: 280),
            _SectionHeading(title: 'Secondary'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 72),
            ..._primaryVariants.map((variant) => _ColumnHeader(label: variant.label)),
          ],
        ),
        const SizedBox(height: 24),
        ...ActionButtonSize.values
            .where((element) => element == ActionButtonSize.large || element == ActionButtonSize.medium || element == ActionButtonSize.small)
            .map(
              (size) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 72,
                      child: Text(
                        _sizeLabel(size),
                        style: poppinsRegular14.copyWith(color: textSecondary),
                      ),
                    ),
                    ..._primaryVariants.map(
                      (variant) => _ButtonCell(
                        viewModel: variant.builder(size),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Row(
            children: const [
              SizedBox(width: 280),
              _SectionHeading(title: 'Secondary'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 72),
              ..._secondaryVariants.map((variant) => _ColumnHeader(label: variant.label)),
            ],
          ),
          const SizedBox(height: 24),
        ...ActionButtonSize.values
            .where((element) => element == ActionButtonSize.large || element == ActionButtonSize.medium || element == ActionButtonSize.small)
            .map(
              (size) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 72,
                      child: Text(
                        _sizeLabel(size),
                        style: poppinsRegular14.copyWith(color: textSecondary),
                      ),
                    ),
                    ..._secondaryVariants.map(
                      (variant) => _ButtonCell(
                        viewModel: variant.builder(size),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }

  String _sizeLabel(ActionButtonSize size) {
    switch (size) {
      case ActionButtonSize.large:
        return 'Large';
      case ActionButtonSize.medium:
        return 'Medium';
      case ActionButtonSize.small:
        return 'Small';
      case ActionButtonSize.iconOnlySmall:
      case ActionButtonSize.iconOnlyMedium:
      case ActionButtonSize.iconOnlyLarge:
        return '';
    }
  }
}

class _ButtonVariant {
  final String label;
  final ActionButtonViewModel Function(ActionButtonSize size) builder;

  const _ButtonVariant({required this.label, required this.builder});
}

class _SectionHeading extends StatelessWidget {
  final String title;

  const _SectionHeading({required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 5 * 136,
      child: Text(
        title,
        style: poppinsRegular16.copyWith(fontWeight: FontWeight.w600, color: textPrimary),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ColumnHeader extends StatelessWidget {
  final String label;

  const _ColumnHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 136,
      child: Text(
        label,
        style: poppinsRegular12.copyWith(color: textSecondary),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ButtonCell extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const _ButtonCell({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 136,
      child: Center(
        child: ActionButton.instantiate(viewModel: viewModel),
      ),
    );
  }
}

class _NoGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
