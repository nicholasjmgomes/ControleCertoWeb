import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({required this.mensagem, super.key});

  final String mensagem;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(mensagem),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
  }
}
