import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/navbar', (route) => false);
        }

        if (state is AuthFailed) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Container(
            width: 155,
            height: 150,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/Logo.png',
              ),
            )),
          ),
        ),
      ),
    );
  }
}
