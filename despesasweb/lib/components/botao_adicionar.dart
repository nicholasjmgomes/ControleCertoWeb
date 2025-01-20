import 'package:flutter/material.dart';

class AdicionarDespesaBotao extends StatelessWidget {
  const AdicionarDespesaBotao(
      {required this.onPressed, this.tooltip, super.key});

  final void Function() onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 128, 199, 228),
      ),
    );
  }
}
