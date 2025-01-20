extension PegaValorEnum on Enum {
  String retornaValorDoEnumString([bool upperCase = true]) => upperCase
      ? _capitalizeFirst(retornaValorDoEnumString(false))
      : toString().split(".").last;

  String _capitalizeFirst(String v) => v[0].toUpperCase() + v.substring(1);
}
