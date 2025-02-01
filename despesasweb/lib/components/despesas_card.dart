import 'package:expenses_app/utils/formatadores.dart';
import 'package:expenses_app/variaveis_globais.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/despesas.dart';
import '../modules/views/detalhes_despesa.dart';

class DespesasCard extends StatelessWidget {
  const DespesasCard(
    this.despesa, {
    super.key,
    required this.cardColor,
    required this.onRemoveDespesa,
    required this.onEditDespesa,
  });

  final Despesas despesa;
  final Color cardColor;
  final void Function(Despesas despesa) onRemoveDespesa;
  final void Function(Despesas despesaId) onEditDespesa;

  @override
  Widget build(context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => DetalhesDespesa(
            onPressedEditar: () => onEditDespesa(despesa),
            onPressed: () => onRemoveDespesa(despesa),
            despesa: despesa,
          ),
        ),
        splashColor: Colors.blue,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                despesa.nomeDespesa,
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'R\$',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          despesa.valor.toStringAsFixed(2).replaceAll('.', ','),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          categoryIcons[despesa.categoria],
                          size: 20,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          Formatadores.dataFormatada(despesa.data),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.money,
                          color: Colors.green,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          despesa.formaPagamento.nome,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
