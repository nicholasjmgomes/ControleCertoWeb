import 'package:expenses_app/enums/enum_nomeado.dart';
import 'package:expenses_app/utils/extensao_enum.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const categoryIcons = {
  TipoDespesa.alimentacao: Icons.lunch_dining,
  TipoDespesa.trabalho: Icons.work,
  TipoDespesa.viagem: Icons.flight_takeoff,
  TipoDespesa.lazer: Icons.movie,
};

enum TipoDespesa implements EnumNomeado {
  @JsonValue("alimentacao")
  alimentacao("Alimentação"),
  @JsonValue("trabalho")
  trabalho("Trabalho"),
  @JsonValue("viagem")
  viagem("Viagem"),
  @JsonValue("lazer")
  lazer("Lazer");

  @override
  final String nome;

  @override
  String pegaValorEnum([bool capitalizeFirst = true]) =>
      retornaValorDoEnumString(capitalizeFirst);

  const TipoDespesa(this.nome);

  String toJson() => toString().split('.').last;

  static TipoDespesa fromJson(String json) {
    return TipoDespesa.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == json.toLowerCase(),
      orElse: () => throw ArgumentError('Tipo de despesa desconhecida: $json'),
    );
  }
}
