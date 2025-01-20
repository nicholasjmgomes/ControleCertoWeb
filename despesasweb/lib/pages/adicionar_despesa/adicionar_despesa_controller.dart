import 'package:expenses_app/components/salvamento_sucesso.dart';
import 'package:expenses_app/enums/tipo_despesa.dart';
import 'package:expenses_app/injections/custom_injection.dart';
import 'package:expenses_app/models/despesas_service.dart';
import 'package:expenses_app/pages/pagina_inicial/pagina_inicial_controller.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AdicionarDespesaController {
  final nomeDespesaController = TextEditingController();

  final valorDespesaController = TextEditingController();

  final descricaoDespesaController = TextEditingController();

  final ValueNotifier<DateTime?> dataEscolhidaNotifier =
      ValueNotifier<DateTime?>(null);

  final ValueNotifier<TipoDespesa> despesaEscolhidaNotifier =
      ValueNotifier<TipoDespesa>(TipoDespesa.alimentacao);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final formatter = DateFormat("dd/MM/yyyy");

  final paginaInicialcontroller = getIt<PaginaInicialController>();

  void dataSelecionada(BuildContext context) async {
    final agora = DateTime.now();
    final primeiraData = DateTime(agora.year - 1, agora.month, agora.day);
    final dataIndicada = await showDatePicker(
      context: context,
      initialDate: agora,
      firstDate: primeiraData,
      lastDate: agora,
    );
    dataEscolhidaNotifier.value = dataIndicada;
  }

  Future<void> onPressedSalvar() async {
    final double? valorEnviado = double.tryParse(valorDespesaController.text);

    final despesa = Despesas(
      idDespesa: gerarIdDespesa(),
      nomeDespesa: nomeDespesaController.text,
      valor: valorEnviado!,
      data: dataEscolhidaNotifier.value!,
      categoria: despesaEscolhidaNotifier.value,
      descricao: descricaoDespesaController.text,
    );

    try {
      await DespesasService().saveDespesa(despesa);
      paginaInicialcontroller.fetchDespesas();
    } catch (e) {
      CustomSnackbar(mensagem: 'Não foi possível salvar a despesa!');
    }
  }

  void dispose() {
    nomeDespesaController.dispose();
    valorDespesaController.dispose();
  }

  static String gerarIdDespesa() {
    return const Uuid().v4();
  }
}
