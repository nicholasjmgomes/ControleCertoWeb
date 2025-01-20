import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelarBotao extends StatelessWidget {
  const CancelarBotao({required this.onPressed, this.tooltip, super.key});

  final void Function() onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Cancelar',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 200, 59, 224),
        ),
      ),
    );
  }
}
