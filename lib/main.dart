import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/bloc/navigation/navigation_cubit.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/event_admin.dart';
import 'package:event_application/ui/pages/event_category.dart';
import 'package:event_application/ui/pages/event_create.dart';
import 'package:event_application/ui/pages/event_detail.dart';
import 'package:event_application/ui/pages/home_page.dart';
import 'package:event_application/ui/pages/login_page.dart';
import 'package:event_application/ui/pages/navbar_page.dart';
import 'package:event_application/ui/pages/register_page.dart';
import 'package:event_application/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrent()),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: bglight,
            appBarTheme: AppBarTheme(
                backgroundColor: bglight,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: blackColor),
                titleTextStyle: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ))),
        // home: CreateEvent(),
        routes: {
          '/': (context) => const SplashPage(),
          '/navbar': (context) => const NavbarBottom(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
