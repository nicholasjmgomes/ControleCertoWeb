import 'package:expenses_app/components/botao_salvar.dart';
import 'package:flutter/material.dart';

class ErroDialog extends StatelessWidget {
  const ErroDialog({required this.content, required this.text, super.key});

  final String content;
  final String text;

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text(text),
      content: Text(content),
      actions: [
        BotaoSalvar(
          text: 'Ok',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
