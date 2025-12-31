import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final bool isObscureText;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    required bool autofocus,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
      style: TextStyle(color: Colors.white),
    );
  }
}
