import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.maxFinite,
      child: DrawerHeader(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 3, 8, 77),
        ),
        child: Center(
          child: Text(
            'Adicionar despesa',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
