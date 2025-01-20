import 'package:flutter/material.dart';

class BotaoExcluir extends StatelessWidget {
  const BotaoExcluir({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
  }
}
