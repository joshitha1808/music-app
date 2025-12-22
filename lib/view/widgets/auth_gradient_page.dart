import 'package:flutter/material.dart';
import 'package:client/core/theme/app_pallete.dart';

class AuthGradientPage extends StatelessWidget {
  const AuthGradientPage({super.key});

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
        onPressed: () {},
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
      ),
    );
  }
}
