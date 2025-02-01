import 'package:expenses_app/enums/enum_nomeado.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../utils/extensao_enum.dart';

enum TipoDespesa implements EnumNomeado {
  @JsonValue("Alimentacao")
  alimentacao("Alimentação"),
  @JsonValue("Trabalho")
  trabalho("Trabalho"),
  @JsonValue("Viagem")
  viagem("Viagem"),
  @JsonValue("Lazer")
  lazer("Lazer");

  @override
  final String nome;

  @override
  String pegaValorEnum([bool capitalizeFirst = true]) =>
      retornaValorDoEnumString(capitalizeFirst);

  const TipoDespesa(this.nome);

  String toJson() => toString().split('.').last;

  static TipoDespesa fromJson(String json) {
    return TipoDespesa.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == json.toLowerCase(),
      orElse: () => throw ArgumentError('Tipo de despesa desconhecida: $json'),
    );
  }
}
