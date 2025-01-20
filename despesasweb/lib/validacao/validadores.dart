class Validadores {
  static String? nome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome obrigatório';
    }
    return null;
  }

  static String? descricao(String? value) {
    if (value == null || value.isEmpty) {
      return 'Descrição obrigatório';
    }
    return null;
  }

  static String? valor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Valor obrigatório';
    }
    return null;
  }

  static String? data(String? value) {
    if (value == null || value.isEmpty) {
      return 'Data inválida';
    }
    return null;
  }
}
