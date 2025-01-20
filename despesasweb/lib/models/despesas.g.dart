// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Despesas _$DespesasFromJson(Map<String, dynamic> json) => Despesas(
      idDespesa: json['idDespesa'] as String,
      descricao: json['descricao'] as String,
      nomeDespesa: json['nomeDespesa'] as String,
      valor: (json['valor'] as num).toDouble(),
      data: DateTime.parse(json['data'] as String),
      categoria: $enumDecode(_$TipoDespesaEnumMap, json['categoria']),
      formaPagamento:
          $enumDecode(_$FormaPagamentoEnumMap, json['formaPagamento']),
    );

Map<String, dynamic> _$DespesasToJson(Despesas instance) => <String, dynamic>{
      'idDespesa': instance.idDespesa,
      'nomeDespesa': instance.nomeDespesa,
      'valor': instance.valor,
      'data': instance.data.toIso8601String(),
      'categoria': instance.categoria,
      'descricao': instance.descricao,
      'formaPagamento': instance.formaPagamento,
    };

const _$TipoDespesaEnumMap = {
  TipoDespesa.alimentacao: 'alimentacao',
  TipoDespesa.trabalho: 'trabalho',
  TipoDespesa.viagem: 'viagem',
  TipoDespesa.lazer: 'lazer',
};

const _$FormaPagamentoEnumMap = {
  FormaPagamento.pix: 'pix',
  FormaPagamento.debito: 'debito',
  FormaPagamento.credito: 'credito',
  FormaPagamento.dinheiro: 'dinheiro',
};
