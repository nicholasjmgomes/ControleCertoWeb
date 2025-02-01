import 'package:expenses_app/components/botao_editar.dart';
import 'package:expenses_app/components/botao_excluir.dart';
import 'package:expenses_app/components/botao_voltar.dart';
import 'package:expenses_app/modules/controllers/despesas_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/title.dart';
import '../../injections/custom_injection.dart';
import '../../models/despesas.dart';
import '../../utils/formatadores.dart';

class DetalhesDespesa extends StatefulWidget {
  const DetalhesDespesa(
      {super.key,
      required this.onPressed,
      required this.despesa,
      required this.onPressedEditar});

  final void Function() onPressed;
  final void Function() onPressedEditar;
  final Despesas despesa;

  @override
  State<DetalhesDespesa> createState() => _DetalhesDespesaState();
}

class _DetalhesDespesaState extends State<DetalhesDespesa> {
  final controller = getIt<DespesasController>();
  late List<Despesas> despesas;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            maxWidth: 300,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 3, 8, 77),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 16,
                  children: [
                    BotaoVoltar(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const TitleText(
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
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Título: ',
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 3, 8, 77),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.despesa.nomeDespesa,
                    style: GoogleFonts.roboto(color: Colors.lightBlue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Valor: ',
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 3, 8, 77),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ ${widget.despesa.valor.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: GoogleFonts.roboto(color: Colors.lightBlue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Data: ',
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 3, 8, 77),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Formatadores.dataFormatada(widget.despesa.data),
                    style: GoogleFonts.roboto(color: Colors.lightBlue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tipo de despesa: ',
                    style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 3, 8, 77),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.despesa.categoria.nome,
                    style: GoogleFonts.roboto(color: Colors.lightBlue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  'Descrição: ',
                  style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 3, 8, 77),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Flexible(
                child: Text(
                  widget.despesa.descricao,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(color: Colors.lightBlue),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: BotaoEditar(onPressed: () async {
                      widget.onPressedEditar();
                      Navigator.of(context).pop();
                    }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: BotaoExcluir(
                      onPressed: () {
                        widget.onPressed();
                        Navigator.of(context).pop();
                        controller.toastExclusaoSucesso(context);
                      },
                    ),
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
