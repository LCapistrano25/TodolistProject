import 'package:flutter/material.dart';
import 'package:project_to_do_list/Components/Buttons/action_button.dart';
import 'package:project_to_do_list/Components/Buttons/action_button_view_model.dart';
// import 'package:project_to_do_list/Shared/colors.dart'; // remova se não usar diretamente

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estilos de Botões')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionTitle('Estilo primário'),
                const SizedBox(height: 12),
                _ButtonShowcase(style: ActionButtonStyle.primary),

                const SizedBox(height: 24),
                const Divider(),

                const SizedBox(height: 24),
                const _SectionTitle('Secondary'),
                const SizedBox(height: 12),
                _ButtonShowcase(style: ActionButtonStyle.secondary),

                const SizedBox(height: 24),
                const Divider(),

                const SizedBox(height: 24),
                const _SectionTitle('Disabled'),
                const SizedBox(height: 12),
                _ButtonShowcase(style: ActionButtonStyle.disabled),

                const SizedBox(height: 24),
                const Divider(),

                const SizedBox(height: 24),
                const _SectionTitle('Destructive'),
                const SizedBox(height: 12),
                _ButtonShowcase(style: ActionButtonStyle.destructive),

                const SizedBox(height: 24),
                const Divider(),

                const _SectionTitle('Estilo Secudário'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Título de seção padronizado
class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

/// Mostra os 3 tamanhos (Large/Medium/Small), cada qual com 3 variações:
/// texto, texto+ícone e ícone-only.
class _ButtonShowcase extends StatelessWidget {
  final ActionButtonStyle style;
  const _ButtonShowcase({required this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SizeGroup(
          label: 'Large',
          size: ActionButtonSize.large,
          style: style,
        ),
        const SizedBox(height: 16),
        _SizeGroup(
          label: 'Medium',
          size: ActionButtonSize.medium,
          style: style,
        ),
        const SizedBox(height: 16),
        _SizeGroup(
          label: 'Small',
          size: ActionButtonSize.small,
          style: style,
        ),
      ],
    );
  }
}

/// Bloco de tamanho específico com título + variações dos botões.
/// Usa Wrap para responsividade (quebra de linha automática).
class _SizeGroup extends StatelessWidget {
  final String label;
  final ActionButtonSize size;
  final ActionButtonStyle style;

  const _SizeGroup({
    required this.label,
    required this.size,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: size,
                style: style,
                text: label,
              ),
            ),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: size,
                style: style,
                text: label,
                icon: Icons.add,
              ),
            ),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: _toIconOnly(size),
                style: style,
                icon: Icons.add,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Mapeia o tamanho “texto” para o correspondente “iconOnly”
  ActionButtonSize _toIconOnly(ActionButtonSize s) {
    switch (s) {
      case ActionButtonSize.large || ActionButtonSize.iconOnlyLarge:
        return ActionButtonSize.iconOnlyLarge;
      case ActionButtonSize.medium || ActionButtonSize.iconOnlyMedium:
        return ActionButtonSize.iconOnlyMedium;
      case ActionButtonSize.small || ActionButtonSize.iconOnlySmall:
        return ActionButtonSize.iconOnlySmall;
    }
  }
}
