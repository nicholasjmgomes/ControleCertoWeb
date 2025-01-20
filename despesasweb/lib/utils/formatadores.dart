import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

final formatter = DateFormat("yyyy-MM-dd");

class Formatadores {
  static TextInputFormatter dinheiro() {
    return CurrencyInputFormatter(
      thousandSeparator: ThousandSeparator.Period,
      leadingSymbol: 'R\$',
      useSymbolPadding: true,
    );
  }

  static TextInputFormatter valor() {
    return FilteringTextInputFormatter.allow(
      RegExp(
        r'[0-9.,]',
      ),
    );
  }

  static String dataFormatada(DateTime data) {
    return DateFormat("dd MMM yyyy").format(data);
  }
}
