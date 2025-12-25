import 'package:flutter/material.dart';
import 'package:client/core/theme/app_pallete.dart';

class AuthGradientPage extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const AuthGradientPage({super.key,required this.buttonText,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient2],
          begin: AlignmentGeometry.bottomLeft,
          end: AlignmentGeometry.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
