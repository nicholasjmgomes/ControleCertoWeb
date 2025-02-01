class DespesasEndpoints {
  static const String baseUrl = 'https://localhost:44300/api/despesas/';

  static String getDespesas() {
    return baseUrl;
  }

  static String getDespesaEspecifica(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String saveDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String createDespesa() {
    return baseUrl;
  }

  static String deleteDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }

  static String updateDespesa(int idDespesa) {
    return '$baseUrl$idDespesa';
  }
}
