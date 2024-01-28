import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmDialogIcon extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onConfirm;
  final Icon iconDialog;

  const ConfirmDialogIcon({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.iconDialog,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconDialog,
      iconSize: 20,
      onPressed: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.topSlide,
          title: title,
          desc: description,
          btnCancelOnPress: () {},
          btnOkOnPress: onConfirm,
        ).show();
      },
    );
  }
}
