import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'botao_voltar.dart';

class Header extends StatelessWidget {
  const Header(
      {required this.texto,
      this.borderRadius,
      this.child,
      this.padding,
      super.key});

  final Widget? child;
  final String texto;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.zero,
        color: Color.fromARGB(255, 3, 8, 77),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BotaoVoltar(
              onPressed: () => Navigator.of(context).pop(),
            ),
            Padding(
              padding: padding!,
              child: Text(
                texto,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
