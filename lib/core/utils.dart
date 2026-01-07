import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

extension HexColor on Color {
  String toHex() {
    return '#${red.toRadixString(16).padLeft(2,'0')}'
           '${green.toRadixString(16).padLeft(2,'0')}'
           '${blue.toRadixString(16).padLeft(2,'0')}';
  }
}

void showSnackBar(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(SnackBar(content: Text(message)));
}

Future<File?> pickAudio() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (filePickerRes != null) {
      return File(filePickerRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickImage() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (filePickerRes != null) {
      return File(filePickerRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
  }
