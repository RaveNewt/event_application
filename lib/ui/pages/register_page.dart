import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/models/register_model.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool validate() {
    print(usernameController.text);

    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
      }
    }, builder: (context, state) {
      if (state is AuthLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(
                top: 100,
                bottom: 24,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/Logo.png',
                  ),
                ),
              ),
            ),
            CustomFormField(
              title: 'Username',
              controller: usernameController,
              icon: Icon(Icons.person),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomFormField(
              hintText: 'Eventify@gmail.com',
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
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomFilledButton(
              title: 'Register',
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthRegister(
                        RegisterFormModel(
                          username: usernameController.text,
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
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      );
    });
  }
}
