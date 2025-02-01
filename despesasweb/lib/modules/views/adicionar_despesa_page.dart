import 'package:expenses_app/components/base_drawer.dart';
import 'package:expenses_app/components/botao_cancelar.dart';
import 'package:expenses_app/components/botao_salvar.dart';
import 'package:expenses_app/components/dropdown.dart';
import 'package:expenses_app/components/text_box.dart';
import 'package:expenses_app/components/title.dart';
import 'package:expenses_app/enums/forma_pagamento.dart';
import 'package:expenses_app/injections/custom_injection.dart';
import 'package:expenses_app/enums/tipo_despesa.dart';
import 'package:expenses_app/modules/controllers/despesas_controller.dart';
import 'package:expenses_app/validacao/validadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/formatadores.dart';

class AdicionarDespesa extends StatefulWidget {
  const AdicionarDespesa({super.key});

  @override
  State<AdicionarDespesa> createState() => _AdicionarDespesaState();
}

class _AdicionarDespesaState extends State<AdicionarDespesa> {
  final controller = getIt<DespesasController>();

  @override
  void initState() {
    controller.limparCampos();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Drawer(
        width: 550,
        shape: const BeveledRectangleBorder(),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(
                texto: "Adicionar despesa",
                padding: EdgeInsets.only(left: 150),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleText('Nome da despesa'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextBox(
                        controller: controller.nomeDespesaController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validadores.nome(value),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const TitleText('Valor da despesa'),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: TextBox(
                                  controller: controller.valorDespesaController,
                                  prefixText: 'R\$ ',
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    Formatadores.valor(),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      Validadores.valor(value!),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleText('Forma de pagamento'),
                              ListenableBuilder(
                                listenable:
                                    controller.pagamentoEscolhidoNotifier,
                                builder: (context, child) {
                                  return Dropdown<FormaPagamento?>(
                                    value: controller
                                        .pagamentoEscolhidoNotifier.value,
                                    items: FormaPagamento.values,
                                    itemToString: (FormaPagamento? value) =>
                                        value!.nome,
                                    onChanged: (FormaPagamento? newValue) =>
                                        controller.pagamentoEscolhidoNotifier
                                            .value = newValue!,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ValueListenableBuilder<DateTime?>(
                                valueListenable:
                                    controller.dataEscolhidaNotifier,
                                builder: (context, dataEscolhida, child) {
                                  return Text(
                                    dataEscolhida == null
                                        ? 'Escolher data'
                                        : controller.formatter
                                            .format(dataEscolhida),
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () =>
                                    controller.dataSelecionada(context),
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TitleText('Tipo de despesa'),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 260),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                          ),
                          Expanded(
                            child: ListenableBuilder(
                              listenable: controller.tipoDespesaNotifier,
                              builder: (context, child) {
                                return Dropdown<TipoDespesa?>(
                                  value: controller.tipoDespesaNotifier.value,
                                  items: TipoDespesa.values,
                                  itemToString: (TipoDespesa? value) =>
                                      value!.nome,
                                  onChanged: (TipoDespesa? newValue) =>
                                      controller.tipoDespesaNotifier.value =
                                          newValue!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const TitleText('Descrição da despesa'),
                    SizedBox(
                      height: 220,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          bottom: 20,
                        ),
                        child: TextBox(
                          controller: controller.descricaoDespesaController,
                          maxLines: 30,
                          maxLength: 200,
                          validator: (value) => Validadores.descricao(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CancelarBotao(
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          BotaoSalvar(
                            text: 'Salvar',
                            onPressed: () {
                              controller.onPressedSalvar();
                              if (controller.formKey.currentState?.validate() ??
                                  false) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
