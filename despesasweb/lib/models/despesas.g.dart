// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Despesas _$DespesasFromJson(Map<String, dynamic> json) => Despesas(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      nomeDespesa: json['nomeDespesa'] as String,
      valor: (json['valor'] as num).toDouble(),
      data: DateTime.parse(json['data'] as String),
      categoria: $enumDecode(_$TipoDespesaEnumMap, json['categoria']),
      formaPagamento:
          $enumDecode(_$FormaPagamentoEnumMap, json['formaPagamento']),
    );

Map<String, dynamic> _$DespesasToJson(Despesas instance) => <String, dynamic>{
      'id': instance.id,
      'nomeDespesa': instance.nomeDespesa,
      'valor': instance.valor,
      'data': instance.data.toIso8601String(),
      'categoria': instance.categoria,
      'descricao': instance.descricao,
      'formaPagamento': instance.formaPagamento,
    };

const _$TipoDespesaEnumMap = {
  TipoDespesa.alimentacao: 'Alimentacao',
  TipoDespesa.trabalho: 'Trabalho',
  TipoDespesa.viagem: 'Viagem',
  TipoDespesa.lazer: 'Lazer',
};

const _$FormaPagamentoEnumMap = {
  FormaPagamento.pix: 'Pix',
  FormaPagamento.debito: 'Debito',
  FormaPagamento.credito: 'Credito',
  FormaPagamento.dinheiro: 'Dinheiro',
};
