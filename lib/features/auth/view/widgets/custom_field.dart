import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final bool isObscureText;
  final String hintText;
  final TextEditingController controller;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
