import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/layout/colors.dart';

void confirmDialog(
  BuildContext context,
  String title,
  void Function() onConfirm, {
  String? cancelText,
  String? confirmText,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromRGBO(232, 232, 232, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: Text(
            cancelText ?? 'Cancelar',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'OK'),
            onConfirm(),
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              AppColors.primary,
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          child: Text(
            confirmText ?? 'Confirmar',
            style: const TextStyle(
              color: Color.fromRGBO(232, 232, 232, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
