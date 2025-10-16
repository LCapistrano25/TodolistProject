import 'package:flutter/material.dart';

enum ActionInputStyle {
  primary,
  secondary,
}
enum ActionTypeInputFormatter {
  digitsOnly,
  singleLine,
  lettersOnly,
  lettersAndDigits,
  decimal,       // aceita decimal sem limite de casas
  decimal2Fixed, // aceita até 2 casas decimais
  global, // aceita tudo
}

class ActionInputViewModel {
  final ActionInputStyle style; // Define o estilo visual (primary, secondary, error, disabled)
  final ActionTypeInputFormatter formatter;

  final String? text; // Texto inicial ou valor fixo do input
  final String? hintText; // Texto exibido quando o campo está vazio (placeholder)
  final String? labelText; // Rótulo exibido acima/dentro do input
  final String? helperText; // Texto auxiliar exibido abaixo do input
  final String? errorText; // Mensagem de erro exibida quando inválido

  final IconData? prefixIcon; // Ícone exibido antes do texto
  final IconData? suffixIcon; // Ícone exibido depois do texto

  final bool readOnly; // Impede a edição, mas mantém seleção/cópia
  final bool enabled; // Habilita ou desabilita totalmente o campo
  final bool obscureText; // Oculta o texto (útil para senha)

  final TextEditingController? controller; // Controlador para ler/alterar o valor
  final FocusNode? focusNode; // Gerencia o foco do campo

  final TextInputType keyboardType; // Define o tipo de teclado (texto, número, e-mail, etc.)
  final TextInputAction? textInputAction; // Ação do botão do teclado (next, done, search...)
  final int? maxLines; // Número máximo de linhas permitidas
  final int? minLines; // Número mínimo de linhas exibidas
  final int? maxLength; // Limite máximo de caracteres

  final ValueChanged<String>? onChanged; // Callback chamado sempre que o texto muda
  final ValueChanged<String>? onSubmitted; // Callback chamado ao enviar (pressionar "done")
  final VoidCallback? onTap; // Callback chamado quando o campo é clicado

  final Color? backgroundColor; // Cor de fundo do input
  final Color? borderColor; // Cor da borda
  final Color? textColor; // Cor do texto digitado
  final Color? iconColor; // Cor dos ícones (prefixo/sufixo)

  ActionInputViewModel({
    required this.style,
    this.formatter = ActionTypeInputFormatter.global,
    this.text,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
  }) : assert(
          text != null || hintText != null || labelText != null,
          'Deve ter pelo menos um texto, hint ou label.',
        );
}
