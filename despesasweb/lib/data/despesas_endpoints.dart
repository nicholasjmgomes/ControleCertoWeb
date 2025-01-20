class DespesasEndpoints {
  static const String baseUrl =
      'https://despesasweb-default-rtdb.firebaseio.com/';
  static const String despesasPath = 'despesas.json';

  static String getDespesas() {
    return '$baseUrl$despesasPath';
  }

  static String saveDespesa(String idDespesa) {
    return '$baseUrl/despesas/$idDespesa.json';
  }

  static String deleteDespesa(String idDespesa) {
    return '$baseUrl/despesas/$idDespesa.json';
  }
}
