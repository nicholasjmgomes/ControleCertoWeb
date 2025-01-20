import 'package:json_annotation/json_annotation.dart';

import '../enums/forma_pagamento.dart';
import '../enums/tipo_despesa.dart';

part 'despesa_resumida.g.dart';

@JsonSerializable()
class DespesaResumida {
  DespesaResumida(
      {required this.categoria,
      required this.data,
      required this.descricao,
      required this.formaPagamento,
      required this.idDespesa,
      required this.nomeDespesa,
      required this.valor});

  String idDespesa;
  final String nomeDespesa;
  final double valor;
  final DateTime data;
  final TipoDespesa categoria;
  final String descricao;
  final FormaPagamento formaPagamento;

  Map<String, dynamic> toJson() => _$DespesaResumidaToJson(this);

  factory DespesaResumida.fromJson(Map<String, dynamic> json) =>
      _$DespesaResumidaFromJson(json);
}
