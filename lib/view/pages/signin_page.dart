import 'package:client/core/theme/app_pallete.dart';
import 'package:client/view/widgets/auth_gradient_page.dart';
import 'package:client/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Pallete.backgroundColor),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 15),
              CustomField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              CustomField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientPage(buttonText: 'Sign in'),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text:
                      "Don't have  an  acount?  ", //or 'Don\'t have an account
                  style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),

                  children: const [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: Pallete.gradient2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
