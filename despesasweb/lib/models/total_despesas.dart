import 'package:expenses_app/enums/tipo_despesa.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:flutter/material.dart';

class TotalDespesas {
  const TotalDespesas(
      {required this.categoria,
      required this.despesas,
      required this.corDespesa});

  TotalDespesas.forTipoDespesa(
      List<Despesas> todasDespesas, this.categoria, this.corDespesa)
      : despesas = todasDespesas
            .where((despesa) => despesa.categoria == categoria)
            .toList();

  final TipoDespesa categoria;
  final List<Despesas> despesas;
  final Color corDespesa;

  double get totalDespesas {
    double soma = 0;

    for (final despesas in despesas) {
      soma += despesas.valor;
    }
    return soma;
  }
}
