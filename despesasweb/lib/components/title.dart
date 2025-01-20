import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText(
    this.titulo, {
    super.key,
    this.bottomSpace = true,
    this.fontSize = 14,
    this.color = Colors.blue,
    this.fontWeight = FontWeight.bold,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.margin = const EdgeInsets.only(left: 18),
  });

  final String titulo;
  final EdgeInsetsGeometry? margin;
  final double fontSize;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? color;
  final FontWeight? fontWeight;
  final bool bottomSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            titulo,
            style: GoogleFonts.roboto(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
            ),
          ),
          Visibility(
            visible: bottomSpace,
            child: const SizedBox(
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
