import 'package:expenses_app/enums/tipo_despesa.dart';

import 'package:json_annotation/json_annotation.dart';

part 'despesas.g.dart';

@JsonSerializable()
class Despesas {
  Despesas(
      {required this.idDespesa,
      required this.descricao,
      required this.nomeDespesa,
      required this.valor,
      required this.data,
      required this.categoria});

  String idDespesa;
  final String nomeDespesa;
  final double valor;
  final DateTime data;
  final TipoDespesa categoria;
  final String descricao;

  Map<String, dynamic> toJson() => _$DespesasToJson(this);

  factory Despesas.fromJson(Map<String, dynamic> json) =>
      _$DespesasFromJson(json);
}
