import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

mixin Mensageria<T extends StatelessWidget> {
  toastSucesso(BuildContext context, String message,
      {FlushbarPosition? position, Duration? duration}) {
    Flushbar flush = Flushbar();

    flush = Flushbar(
      flushbarPosition: position ?? FlushbarPosition.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 3, 8, 77),
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(15),
      messageText: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle_outline_rounded,
          size: 28.0, color: Colors.green),
      shouldIconPulse: false,
    );

    flush.show(context);
  }
}
