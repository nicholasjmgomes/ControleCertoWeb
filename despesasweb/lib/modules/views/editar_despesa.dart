import 'package:expenses_app/components/base_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/botao_cancelar.dart';
import '../../components/botao_data.dart';
import '../../components/botao_salvar.dart';
import '../../components/dropdown.dart';
import '../../components/title.dart';
import '../../enums/forma_pagamento.dart';
import '../../enums/tipo_despesa.dart';
import '../../injections/custom_injection.dart';
import '../../utils/formatadores.dart';
import '../../validacao/validadores.dart';
import '../controllers/despesas_controller.dart';
import '../../components/text_box.dart';

class EditarDespesa extends StatefulWidget {
  const EditarDespesa({super.key});

  @override
  State<EditarDespesa> createState() => _EditarDespesaState();
}

class _EditarDespesaState extends State<EditarDespesa> {
  final controller = getIt<DespesasController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: 400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Header(
                    texto: 'Editar despesa',
                    padding: EdgeInsets.only(left: 95),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 20,
                      ),
                      child: Column(
                        spacing: 20,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleText('Nome da despesa'),
                              TextBox(
                                controller: controller.nomeDespesaController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => Validadores.nome(value),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TitleText('Valor'),
                                    TextBox(
                                      controller:
                                          controller.valorDespesaController,
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
                                  ],
                                ),
                              ),
                              const Spacer(),
                              ValueListenableBuilder(
                                valueListenable:
                                    controller.dataEscolhidaNotifier,
                                builder: (context, dataEscolhida, child) =>
                                    BotaoData(
                                  dataEscolhida: dataEscolhida == null
                                      ? controller.formatter
                                          .format(DateTime.now())
                                      : controller.formatter
                                          .format(dataEscolhida),
                                  onTap: () =>
                                      controller.dataSelecionada(context),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const TitleText('Tipo'),
                                    ListenableBuilder(
                                      listenable:
                                          controller.tipoDespesaNotifier,
                                      builder: (context, child) {
                                        return ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                          ),
                                          child: Dropdown<TipoDespesa>(
                                            value: controller
                                                .tipoDespesaNotifier.value,
                                            items: TipoDespesa.values,
                                            itemToString:
                                                (TipoDespesa? value) =>
                                                    value!.nome,
                                            onChanged:
                                                (TipoDespesa? newValue) =>
                                                    controller
                                                        .tipoDespesaNotifier
                                                        .value = newValue!,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    const TitleText('Pagamento'),
                                    ListenableBuilder(
                                      listenable:
                                          controller.tipoDespesaNotifier,
                                      builder: (context, child) {
                                        return ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14.0),
                                            child: Dropdown<FormaPagamento>(
                                              value: controller
                                                  .pagamentoEscolhidoNotifier
                                                  .value,
                                              items: FormaPagamento.values,
                                              itemToString:
                                                  (FormaPagamento? value) =>
                                                      value!.nome,
                                              onChanged: (FormaPagamento?
                                                      newValue) =>
                                                  controller
                                                      .pagamentoEscolhidoNotifier
                                                      .value = newValue!,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleText('Descrição da despesa'),
                              TextBox(
                                controller:
                                    controller.descricaoDespesaController,
                                maxLength: 200,
                                validator: (value) =>
                                    Validadores.descricao(value),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CancelarBotao(
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              BotaoSalvar(
                                text: 'Salvar',
                                onPressed: () {
                                  final isValid = controller
                                          .formKey.currentState
                                          ?.validate() ??
                                      false;
                                  if (isValid) {
                                    controller.onPressedSalvar();
                                    Navigator.pop(context);
                                    controller.toastDeSucesso(context);
                                  }
                                  return;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
