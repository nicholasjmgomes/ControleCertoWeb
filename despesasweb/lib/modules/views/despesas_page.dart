import 'package:expenses_app/components/chart/chart.dart';
import 'package:expenses_app/injections/custom_injection.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:expenses_app/modules/controllers/despesas_controller.dart';
import 'package:expenses_app/modules/views/adicionar_despesa_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../components/despesas_card.dart';

class DespesasPage extends StatefulWidget {
  const DespesasPage({super.key});

  @override
  State<DespesasPage> createState() => _DespesasPageState();
}

class _DespesasPageState extends State<DespesasPage> {
  final controller = getIt<DespesasController>();
  bool enabled = true;

  @override
  void initState() {
    super.initState();
    controller.startPage();
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
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: controller.isLoadingNotifier,
          builder: (context, bool isLoading, child) => Skeletonizer(
            enabled: isLoading,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          spacing: 30,
                          children: [
                            Text(
                              "Confira o Chart das suas despesas abaixo:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 3, 8, 77),
                                fontSize: 25,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              child: ValueListenableBuilder<List<Despesas>>(
                                valueListenable: controller.despesasNotifier,
                                builder: (context, despesas, child) => Chart(
                                    despesas:
                                        controller.despesasNotifier.value),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 120.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "O Chart acima ",
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                255,
                                                3,
                                                8,
                                                77,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "reflete as despesas registradas ao lado. ",
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "Para mais detalhes de uma despesa específica, consulte a lista ao lado e clique no seu respectivo card!",
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                255,
                                                3,
                                                8,
                                                77,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 120.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Para adicionar uma despesa, ",
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                255,
                                                3,
                                                8,
                                                77,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "clique no botão ao seu canto superior esquerdo!",
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          spacing: 45,
                          children: [
                            Text(
                              "Confira sua lista de despesas abaixo:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 3, 8, 77),
                                fontSize: 25,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100.0),
                              child: ValueListenableBuilder<List<Despesas>>(
                                valueListenable: controller.despesasNotifier,
                                builder: (context, despesas, child) {
                                  return Column(
                                    children: [
                                      Visibility(
                                        visible: controller
                                            .despesasNotifier.value.isNotEmpty,
                                        child: GridView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1.5,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20,
                                          ),
                                          itemCount: controller
                                              .despesasNotifier.value.length,
                                          itemBuilder: (ctx, index) {
                                            final despesa =
                                                controller.despesas[index];

                                            return DespesasCard(
                                              onRemoveDespesa: (despesa) {
                                                controller
                                                    .onPressedExcluir(despesa);
                                              },
                                              onEditDespesa: (despesa) {
                                                controller.onPressedEditar(
                                                    context, despesa.id);
                                              },
                                              despesa,
                                              cardColor: controller
                                                  .getColorForTipoDespesa(
                                                      despesa.categoria),
                                            );
                                          },
                                        ),
                                      ),
                                      Visibility(
                                        visible: controller
                                            .despesasNotifier.value.isEmpty,
                                        child: const Center(
                                          child: Text(
                                            "Nenhuma despesa encontrada",
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
