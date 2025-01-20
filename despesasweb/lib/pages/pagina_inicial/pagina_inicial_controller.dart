import 'package:expenses_app/models/despesas.dart';
import 'package:flutter/material.dart';

import '../../models/despesas_service.dart';

class PaginaInicialController {
  ValueNotifier<List<Despesas>> despesasNotifier =
      ValueNotifier<List<Despesas>>([]);

  final DespesasService despesaService = DespesasService();

  PaginaInicialController();

  Future<void> fetchDespesas() async {
    try {
      final despesas = await despesaService.fetchDespesas();
      despesasNotifier.value = despesas;
    } catch (e) {
      throw Exception('Nenhuma despesa encontrada!');
    }
  }

  Future<void> excluirDespesa(Despesas despesa) async {
    try {
      await despesaService.deleteDespesa(
        despesa.idDespesa,
      );
      await fetchDespesas();
    } catch (e) {
      throw Exception('Não foi possível excluir a despesa.');
    }
  }
}
