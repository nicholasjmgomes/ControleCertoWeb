import 'package:expenses_app/injections/custom_injection.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/pages/pagina_inicial/pagina_inicial.dart';

void main() async {
  customInjection();
  runApp(
    MaterialApp(
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 221, 232, 241)),
        debugShowCheckedModeBanner: false,
        home: const PaginaInicial()),
  );
}
