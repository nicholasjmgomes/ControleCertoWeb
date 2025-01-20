import 'package:expenses_app/injections/custom_injection.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:expenses_app/pages/pagina_inicial/pagina_inicial_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/title.dart';

class DetalhesDespesa extends StatefulWidget {
  const DetalhesDespesa({super.key});

  @override
  State<DetalhesDespesa> createState() => _DetalhesDespesaState();
}

class _DetalhesDespesaState extends State<DetalhesDespesa> {
  final controller = getIt<PaginaInicialController>();
  late List<Despesas> despesas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27.0),
      child: Dialog(
        shape: const BeveledRectangleBorder(),
        child: SizedBox(
          height: 678,
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 3, 8, 77),
                  ),
                  child: const TitleText(
                    'Detalhes da despesa',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    margin: EdgeInsets.only(
                      top: 11,
                      left: 8,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Título: ',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Valor: ',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Data: ',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Tipo de despesa: ',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Descrição: ',
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
