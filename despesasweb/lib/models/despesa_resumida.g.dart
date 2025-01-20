// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_resumida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DespesaResumida _$DespesaResumidaFromJson(Map<String, dynamic> json) =>
    DespesaResumida(
      categoria: $enumDecode(_$TipoDespesaEnumMap, json['categoria']),
      data: DateTime.parse(json['data'] as String),
      descricao: json['descricao'] as String,
      formaPagamento:
          $enumDecode(_$FormaPagamentoEnumMap, json['formaPagamento']),
      idDespesa: json['idDespesa'] as String,
      nomeDespesa: json['nomeDespesa'] as String,
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$DespesaResumidaToJson(DespesaResumida instance) =>
    <String, dynamic>{
      'categoria': _$TipoDespesaEnumMap[instance.categoria],
      'data': instance.data.toIso8601String(),
      'descricao': instance.descricao,
      'formaPagamento': _$FormaPagamentoEnumMap[instance.formaPagamento],
      'idDespesa': instance.idDespesa,
      'nomeDespesa': instance.nomeDespesa,
      'valor': instance.valor,
    };

const _$TipoDespesaEnumMap = {
  TipoDespesa.alimentacao: 'alimentacao',
  TipoDespesa.trabalho: 'trabalho',
  TipoDespesa.lazer: 'lazer',
  TipoDespesa.viagem: 'viagem',
};

const _$FormaPagamentoEnumMap = {
  FormaPagamento.dinheiro: 'dinheiro',
  FormaPagamento.credito: 'credito',
  FormaPagamento.debito: 'debito',
  FormaPagamento.pix: 'pix',
};
