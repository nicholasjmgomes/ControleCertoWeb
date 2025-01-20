import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoSalvar extends StatelessWidget {
  const BotaoSalvar({this.onPressed, required this.text, super.key});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 175, 217, 252),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 200, 59, 224),
        ),
      ),
    );
  }
}
