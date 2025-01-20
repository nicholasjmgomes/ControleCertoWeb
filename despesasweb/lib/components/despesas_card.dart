import 'package:expenses_app/components/botao_excluir.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:expenses_app/modules/views/detalhes_despesa.dart';
import 'package:expenses_app/utils/formatadores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../variaveis_globais.dart';

class DespesasCard extends StatelessWidget {
  const DespesasCard(this.despesa,
      {super.key, required this.onRemoveDespesa, required this.cardColor});

  final Despesas despesa;
  final void Function(Despesas) onRemoveDespesa;
  final Color cardColor;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => const DetalhesDespesa(),
        ),
        splashColor: Colors.blue,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: BotaoExcluir(onPressed: () => onRemoveDespesa(despesa)),
              ),
              Text(
                despesa.nomeDespesa,
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'R\$ ${despesa.valor.toStringAsFixed(2)}',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(categoryIcons[despesa.categoria]),
                  const SizedBox(width: 12),
                  Text(
                    Formatadores.dataFormatada(despesa.data),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
