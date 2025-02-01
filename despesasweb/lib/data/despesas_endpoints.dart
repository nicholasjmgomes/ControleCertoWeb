import 'package:expenses_app/models/despesas.dart';

class DespesasEndpoints {
  static const String baseUrl = 'https://localhost:44300/api/despesas/';

  static String getDespesas() {
    return baseUrl;
  }

  static String getDespesaEspecifica(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String saveDespesa(Despesas despesa) {
    return baseUrl;
  }

  static String deleteDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String updateDespesa(Despesas despesa) {
    return baseUrl;
  }
}
