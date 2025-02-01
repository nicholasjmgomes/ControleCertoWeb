import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../components/salvamento_sucesso.dart';
import '../../enums/forma_pagamento.dart';
import '../../enums/tipo_despesa.dart';
import '../../mixins/mensageria.dart';
import '../../models/despesas.dart';
import '../../models/despesas_service.dart';
import '../../models/total_despesas.dart';
import '../views/adicionar_despesa_page.dart';
import '../views/editar_despesa.dart';

class DespesasController with Mensageria {
  final nomeDespesaController = TextEditingController();

  final valorDespesaController = TextEditingController();

  final descricaoDespesaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<DateTime?> dataEscolhidaNotifier =
      ValueNotifier<DateTime?>(null);

  final ValueNotifier<TipoDespesa?> tipoDespesaNotifier =
      ValueNotifier<TipoDespesa?>(null);

  final ValueNotifier<FormaPagamento?> pagamentoEscolhidoNotifier =
      ValueNotifier<FormaPagamento?>(null);

  final ValueNotifier<Despesas?> despesaParaEdicaoNotifier =
      ValueNotifier<Despesas?>(null);

  final formatter = DateFormat("dd/MM/yyyy");

  ValueNotifier<List<Despesas>> despesasNotifier =
      ValueNotifier<List<Despesas>>([]);

  final DespesasService despesaService = DespesasService();

  List<Despesas> get despesas => despesasNotifier.value;

  final Despesas despesaObjeto = Despesas(
      id: 0,
      descricao: '',
      nomeDespesa: '',
      valor: 0,
      data: DateTime.now(),
      categoria: TipoDespesa.alimentacao,
      formaPagamento: FormaPagamento.pix);

  set despesas(List<Despesas> value) {
    despesasNotifier.value = value;
  }

  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  DespesasController();

  Future<void> startPage() async {
    isLoadingNotifier.value = true;
    await fetchDespesas();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      isLoadingNotifier.value = false;
    });
  }

  Future<void> dataSelecionada(BuildContext context) async {
    final agora = DateTime.now();
    final primeiraData = DateTime(agora.year - 1, agora.month, agora.day);
    final dataIndicada = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        daySplashColor: Colors.transparent,
        firstDate: primeiraData,
        lastDate: agora,
      ),
      dialogSize: const Size(325, 400),
    );
    dataIndicada != null && dataIndicada.isNotEmpty
        ? dataEscolhidaNotifier.value = dataIndicada.first
        : dataEscolhidaNotifier.value = agora;
  }

  Future<void> onPressedEditar(BuildContext context, int despesaId) async {
    final Despesas despesaParaEdicao =
        despesas.firstWhere((despesa) => despesa.id == despesaId);

    await carregarDespesaParaEdicao(despesaParaEdicao);

    await showDialog(
      context: context,
      builder: (BuildContext context) => EditarDespesa(),
    );
  }

  Future<void> onPressedSalvar() async {
    isLoadingNotifier.value = true;

    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      isLoadingNotifier.value = false;
      return;
    }

    final String valorTexto = valorDespesaController.text.replaceAll(',', '.');
    final double? valorEnviado = double.tryParse(valorTexto);

    if (valorEnviado == null) {
      isLoadingNotifier.value = false;
      const CustomSnackbar(mensagem: 'O valor inserido é inválido!');
      return;
    }

    final despesa = Despesas(
      id: despesaParaEdicaoNotifier.value?.id ?? 0,
      nomeDespesa: nomeDespesaController.text,
      valor: valorEnviado,
      data: dataEscolhidaNotifier.value!,
      categoria: tipoDespesaNotifier.value!,
      descricao: descricaoDespesaController.text,
      formaPagamento: pagamentoEscolhidoNotifier.value!,
    );

    try {
      if (despesaParaEdicaoNotifier.value != null) {
        await despesaService.editarDespesa(despesa);
      } else {
        await despesaService.saveDespesa(despesa);
      }
      await fetchDespesas();
    } catch (e) {
      isLoadingNotifier.value = false;
      const CustomSnackbar(mensagem: 'Não foi possível salvar a despesa!');
    }
    limparCampos();
    isLoadingNotifier.value = false;
  }

  Future<void> onPressedExcluir(Despesas despesa) async {
    isLoadingNotifier.value = true;
    try {
      await despesaService.deleteDespesa(despesa.id);
      await fetchDespesas();
    } catch (e) {
      throw Exception('Não foi possível excluir a despesa.');
    } finally {
      isLoadingNotifier.value = false;
    }
  }

  Future<Despesas> carregarDespesaParaEdicao(Despesas despesa) async {
    try {
      final result = await DespesasService().getDespesaEspecifica(despesa.id);
      despesaParaEdicaoNotifier.value = result;

      final despesaResumida = Despesas(
          categoria: result.categoria,
          data: result.data,
          descricao: result.descricao,
          formaPagamento: result.formaPagamento,
          id: despesa.id,
          nomeDespesa: result.nomeDespesa,
          valor: result.valor);

      nomeDespesaController.text = despesaResumida.nomeDespesa;
      valorDespesaController.text =
          despesaResumida.valor.toStringAsFixed(2).replaceAll('.', ',');
      descricaoDespesaController.text = despesaResumida.descricao;
      dataEscolhidaNotifier.value = despesaResumida.data;
      tipoDespesaNotifier.value = despesaResumida.categoria;
      pagamentoEscolhidoNotifier.value = despesaResumida.formaPagamento;

      return despesaResumida;
    } catch (e) {
      throw Exception('Não foi possível carregar a despesa para edição.');
    }
  }

  void limparCampos() {
    nomeDespesaController.clear();
    valorDespesaController.clear();
    dataEscolhidaNotifier.value = null;
    descricaoDespesaController.clear();
    tipoDespesaNotifier.value = null;
    pagamentoEscolhidoNotifier.value = null;
  }

  static String gerarIdDespesa() {
    return const Uuid().v4();
  }

  void toastDeSucesso(BuildContext context) {
    toastSucesso(context, 'Despesa salva com sucesso!');
  }

  Future<void> fetchDespesas() async {
    final List<Despesas> despesas = await despesaService.fetchDespesas();
    despesasNotifier.value = List.from(despesas);
  }

  void toastExclusaoSucesso(BuildContext context) {
    toastSucesso(context, 'Despesa excluída com sucesso!');
  }

  Future<void> showAdicionarDespesaDialog(BuildContext context) async {
    limparCampos();
    despesaParaEdicaoNotifier.value = null;
    await showDialog(
      context: context,
      builder: (BuildContext context) => const AdicionarDespesa(),
    );
  }

  List<TotalDespesas> get buckets {
    return [
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.alimentacao,
          const Color.fromARGB(255, 180, 221, 255)),
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.lazer,
          const Color.fromARGB(255, 160, 204, 241)),
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.viagem,
          const Color.fromARGB(255, 137, 184, 223)),
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.trabalho,
          const Color.fromARGB(255, 59, 92, 117)),
    ];
  }

  Color getColorForTipoDespesa(TipoDespesa tipo) {
    final bucket = buckets.firstWhere(
      (bucket) => bucket.categoria == tipo,
      orElse: () => TotalDespesas(
          categoria: TipoDespesa.alimentacao,
          corDespesa: Colors.green,
          despesas: despesas),
    );
    return bucket.corDespesa;
  }
}
