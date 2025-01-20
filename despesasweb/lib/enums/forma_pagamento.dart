import 'package:expenses_app/enums/enum_nomeado.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../utils/extensao_enum.dart';

enum FormaPagamento implements EnumNomeado {
  @JsonValue("pix")
  pix("Pix"),
  @JsonValue("debito")
  debito("Débito"),
  @JsonValue("credito")
  credito("Crédito"),
  @JsonValue("dinheiro")
  dinheiro("Dinheiro");

  @override
  final String nome;

  @override
  String pegaValorEnum([bool capitalizeFirst = true]) =>
      retornaValorDoEnumString(capitalizeFirst);

  const FormaPagamento(this.nome);

  String toJson() => toString().split('.').last;

  static FormaPagamento fromJson(String json) {
    return FormaPagamento.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == json.toLowerCase(),
      orElse: () => throw ArgumentError('Tipo de despesa desconhecida: $json'),
    );
  }
}
