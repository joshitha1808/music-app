import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(SnackBar(content: Text(message)));
}
