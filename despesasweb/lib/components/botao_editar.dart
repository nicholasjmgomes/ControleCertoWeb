import 'package:flutter/material.dart';

class BotaoEditar extends StatelessWidget {
  const BotaoEditar({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.edit_document,
            color: Color.fromARGB(255, 3, 8, 77),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'Editar',
            style: TextStyle(color: Colors.lightBlue),
          ),
        ],
      ),
    );
  }
}
