import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/auth/view/pages/signin_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_page.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authViewmodelProvider)?.isLoading == true;

    return Scaffold(
      appBar: AppBar(backgroundColor: Pallete.backgroundColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: isLoading
            ? Loader()
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
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
                      CustomField(
                        hintText: 'Name',
                        controller: nameController,
                        autofocus: false,
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: 'Email',
                        controller: emailController,
                        autofocus: false,
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: 'Password',
                        controller: passwordController,
                        isObscureText: true,
                        autofocus: false,
                      ),
                      const SizedBox(height: 20),
                      AuthGradientPage(
                        buttonText: 'Sign up',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(authViewmodelProvider.notifier)
                                .signUpUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already  have  an  acount?  ',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(color: Pallete.gradient2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
