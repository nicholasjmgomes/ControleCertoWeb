import 'dart:convert';
import 'package:expenses_app/models/despesas.dart';
import 'package:http/http.dart' as http;
import '../data/despesas_endpoints.dart';

class DespesasService {
  Future<List<Despesas>> fetchDespesas() async {
    final response = await http.get(Uri.parse(DespesasEndpoints.getDespesas()));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return data.values.map<Despesas>((json) {
        return Despesas.fromJson(json as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('Falha ao carregar despesas');
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
}
