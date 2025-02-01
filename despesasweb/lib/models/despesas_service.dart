import 'dart:convert';
import 'package:expenses_app/models/despesas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/despesas_endpoints.dart';

class DespesasService {
  Future<List<Despesas>> fetchDespesas() async {
    final response = await http.get(Uri.parse(DespesasEndpoints.getDespesas()));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      final List<dynamic> data = json.decode(response.body);

      return data.map<Despesas>((json) {
        return Despesas.fromJson(json as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('Falha ao carregar despesas');
    }
  }

  Future<Despesas> getDespesaEspecifica(int id) async {
    final response = await http.get(
      Uri.parse(
        DespesasEndpoints.getDespesaEspecifica(id),
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return Despesas.fromJson(data);
    } else {
      throw Exception('Falha ao carregar a despesa específica');
    }
  }

  Future<void> saveDespesa(Despesas despesa) async {
    final response = await http.post(
      Uri.parse(DespesasEndpoints.saveDespesa(despesa)),
      body: jsonEncode(despesa.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao salvar despesa');
    }
  }

  Future<void> deleteDespesa(int id) async {
    final response = await http.delete(
      Uri.parse(DespesasEndpoints.deleteDespesa(id)),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir despesa');
    }
  }

  Future<void> editarDespesa(Despesas despesa) async {
    final response = await http.put(
      Uri.parse(DespesasEndpoints.updateDespesa(despesa)),
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
