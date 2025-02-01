import 'package:json_annotation/json_annotation.dart';

import '../enums/forma_pagamento.dart';
import '../enums/tipo_despesa.dart';

part 'despesas.g.dart';

@JsonSerializable()
class Despesas {
  Despesas(
      {required this.id,
      required this.descricao,
      required this.nomeDespesa,
      required this.valor,
      required this.data,
      required this.categoria,
      required this.formaPagamento});

  int id;
  final String nomeDespesa;
  final double valor;
  final DateTime data;
  final TipoDespesa categoria;
  final String descricao;
  final FormaPagamento formaPagamento;

  Map<String, dynamic> toJson() => _$DespesasToJson(this);

  factory Despesas.fromJson(Map<String, dynamic> json) =>
      _$DespesasFromJson(json);
}
