import 'package:expenses_app/enums/tipo_despesa.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:expenses_app/models/total_despesas.dart';
import 'package:flutter/material.dart';

class ChartController {
  final List<Despesas> despesas;

  ChartController(this.despesas);

  List<TotalDespesas> get buckets {
    return [
      TotalDespesas.forTipoDespesa(despesas, TipoDespesa.alimentacao,
          const Color.fromARGB(255, 180, 221, 255)),
      TotalDespesas.forTipoDespesa(
          despesas, TipoDespesa.lazer, Color.fromARGB(255, 160, 204, 241)),
      TotalDespesas.forTipoDespesa(
          despesas, TipoDespesa.viagem, Color.fromARGB(255, 137, 184, 223)),
      TotalDespesas.forTipoDespesa(
          despesas, TipoDespesa.trabalho, Color.fromARGB(255, 111, 159, 199)),
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

  double get maxTotalDespesa {
    double maxTotalDespesa = 0;

    for (final bucket in buckets) {
      if (bucket.totalDespesas > maxTotalDespesa) {
        maxTotalDespesa = bucket.totalDespesas;
      }
    }

    return maxTotalDespesa;
  }
}
