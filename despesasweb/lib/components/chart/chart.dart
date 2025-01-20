import 'package:expenses_app/components/chart/chart_bar.dart';
import 'package:expenses_app/components/chart/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/models/despesas.dart';

import '../../variaveis_globais.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.despesas});

  final List<Despesas> despesas;

  @override
  Widget build(BuildContext context) {
    final controller = ChartController(despesas);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 3, 8, 77),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in controller.buckets)
                  ChartBar(
                    fill: bucket.totalDespesas == 0
                        ? 0
                        : bucket.totalDespesas / controller.maxTotalDespesa,
                    color: bucket.corDespesa,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: controller.buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.categoria],
                        color: bucket.corDespesa,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
