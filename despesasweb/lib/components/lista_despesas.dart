import 'package:expenses_app/components/chart/chart_controller.dart';
import 'package:expenses_app/injections/custom_injection.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:expenses_app/components/despesas_card.dart';
import 'package:expenses_app/pages/pagina_inicial/pagina_inicial_controller.dart';
import 'package:flutter/material.dart';

class ListaDeDespesas extends StatefulWidget {
  const ListaDeDespesas(
      {super.key, required this.onRemoveDespesa, required this.despesas});

  final List<Despesas> despesas;
  final void Function(Despesas despesa) onRemoveDespesa;

  @override
  State<ListaDeDespesas> createState() => _ListaDeDespesasState();
}

class _ListaDeDespesasState extends State<ListaDeDespesas> {
  final controller = getIt<PaginaInicialController>();

  late final ChartController chartController;

  @override
  void initState() {
    super.initState();
    chartController = ChartController(widget.despesas);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.despesas.length,
      itemBuilder: (ctx, index) {
        final despesa = widget.despesas[index];
        final cardColor =
            chartController.getColorForTipoDespesa(despesa.categoria);

        return DespesasCard(
          despesa,
          onRemoveDespesa: widget.onRemoveDespesa,
          cardColor: cardColor,
        );
      },
    );
  }
}
