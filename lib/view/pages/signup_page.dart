import 'package:client/core/theme/app_pallete.dart';
import 'package:client/view/widgets/auth_gradient_page.dart';
import 'package:client/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Pallete.backgroundColor),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign up.',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            CustomField(hintText: 'Name'),
            const SizedBox(height: 15),
            CustomField(hintText: 'Email'),
            const SizedBox(height: 15),
            CustomField(hintText: 'Password'),
            const SizedBox(height: 20),
            AuthGradientPage(),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Already  have  an  acount?  ',
                style: TextStyle(
                  fontSize: 14,
                  //fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),

                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(color: Pallete.gradient2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
