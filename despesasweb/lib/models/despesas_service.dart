import 'dart:convert';
import 'package:expenses_app/models/despesa_resumida.dart';
import 'package:expenses_app/models/despesas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/despesas_endpoints.dart';

class DespesasService {
  Future<List<Despesas>> fetchDespesas() async {
    final response = await http.get(Uri.parse(DespesasEndpoints.getDespesas()));

    if (response.statusCode == 200) {
      final Map<String, dynamic>? data = json.decode(response.body);

      if (data != null) {
        return data.values.map<Despesas>((json) {
          return Despesas.fromJson(json as Map<String, dynamic>);
        }).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Falha ao carregar despesas');
    }
  }

  Future<DespesaResumida> getDespesaEspecifica(String idDespesa) async {
    final response = await http.get(
      Uri.parse(
        DespesasEndpoints.getDespesaEspecifica(idDespesa),
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return DespesaResumida.fromJson(data);
    } else {
      throw Exception('Falha ao carregar a despesa específica');
    }
  }

  Future<void> saveDespesa(Despesas despesa) async {
    final response = await http.put(
      Uri.parse(DespesasEndpoints.saveDespesa(despesa.idDespesa)),
      body: jsonEncode(despesa.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao salvar despesa');
    }
  }

  Future<void> deleteDespesa(String idDespesa) async {
    final response = await http.delete(
      Uri.parse(DespesasEndpoints.deleteDespesa(idDespesa)),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir despesa');
    }
  }

  Future<void> updateDespesa(Despesas despesa) async {
    final response = await http.patch(
      Uri.parse(DespesasEndpoints.updateDespesa(despesa.idDespesa)),
      body: jsonEncode(despesa.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint('Status code: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar despesa');
    }
  }
}
