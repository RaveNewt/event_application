import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/models/login_model.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/navbar', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'assets/images/backgroundLogin.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 270,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 900,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back',
                          style: blackTextStyle.copyWith(
                            fontSize: 22,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                          title: 'Email Address',
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: 'Password',
                          controller: passwordController,
                          obscureText: true,
                          icon: Icon(Icons.key),
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomFilledButton(
                          title: 'Login',
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    LoginFormModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextButton(
                          title: 'Register',
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
