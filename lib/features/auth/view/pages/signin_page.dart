import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_page.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class SigninPage extends ConsumerStatefulWidget {
  const SigninPage({super.key});

  @override
  ConsumerState<SigninPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SigninPage> {
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
    final isLoading = ref.watch(authViewmodelProvider)?.isLoading == true;
    ref.listen(authViewmodelProvider, (_, next) {
      next?.when(
        data: (data) {
          showSnackBar(context, 'Account created sucessfully! please login');
        },
        error: (error, st) {
          showSnackBar(context, error.toString());
        },

        loading: () {},
      );
    });
    return Scaffold(
      appBar: AppBar(backgroundColor: Pallete.backgroundColor),
      body: isLoading
          ? const Loader()
          : Padding(
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
                      buttonText: 'Sign in',
                      onTap: () async {
                        final res = await AuthRemoteRepository().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        final val = switch (res) {
                          Left(value: final l) => l,
                          Right(value: final r) => r,
                        };
                        print(val);
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: RichText(
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
