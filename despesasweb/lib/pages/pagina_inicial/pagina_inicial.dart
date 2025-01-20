import 'package:expenses_app/components/chart/chart.dart';
import 'package:expenses_app/components/lista_despesas.dart';
import 'package:expenses_app/injections/custom_injection.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:expenses_app/pages/adicionar_despesa/adicionar_despesa_page.dart';
import 'package:expenses_app/pages/pagina_inicial/pagina_inicial_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final controller = getIt<PaginaInicialController>();
  bool enabled = true;

  @override
  void initState() {
    super.initState();
    controller.fetchDespesas();
    Future.delayed(Duration(seconds: 2)).then((_) {
      enabled = false;
      setState(
        () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 595),
          child: Text(
            'Controle de Despesas',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 128, 199, 228),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 8, 77),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              style: IconButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 128, 199, 228),
              ),
            );
          },
        ),
      ),
      drawer: AdicionarDespesa(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 535),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skeletonizer(
              enabled: enabled,
              child: ValueListenableBuilder<List<Despesas>>(
                valueListenable: controller.despesasNotifier,
                builder: (context, despesas, child) =>
                    Chart(despesas: controller.despesasNotifier.value),
              ),
            ),
            Expanded(
              child: Skeletonizer(
                enabled: enabled,
                child: ValueListenableBuilder<List<Despesas>>(
                  valueListenable: controller.despesasNotifier,
                  builder: (context, despesas, _) {
                    return despesas.isNotEmpty
                        ? ListaDeDespesas(
                            despesas: despesas,
                            onRemoveDespesa: (despesa) {
                              controller.excluirDespesa(despesa);
                            },
                          )
                        : const Center(
                            child: Text(
                              "Nenhuma despesa encontrada",
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
