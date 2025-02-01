import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoData extends StatelessWidget {
  const BotaoData(
      {super.key, required this.dataEscolhida, required this.onTap});

  final String dataEscolhida;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        splashColor: Colors.lightBlue,
        onTap: onTap,
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataEscolhida,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.lightBlue,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
