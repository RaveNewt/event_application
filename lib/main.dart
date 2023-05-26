import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/bloc/navigation/navigation_cubit.dart';
import 'package:event_application/bloc/transaction/transaction_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/choose_payment.dart';
import 'package:event_application/ui/pages/event_admin.dart';
import 'package:event_application/ui/pages/event_category.dart';
import 'package:event_application/ui/pages/event_create.dart';
import 'package:event_application/ui/pages/event_create_dart.dart';
import 'package:event_application/ui/pages/event_detail.dart';
import 'package:event_application/ui/pages/home_page.dart';
import 'package:event_application/ui/pages/login_page.dart';
import 'package:event_application/ui/pages/navbar_page.dart';
import 'package:event_application/ui/pages/payment_succes.dart';
import 'package:event_application/ui/pages/register_page.dart';
import 'package:event_application/ui/pages/snap.dart';
import 'package:event_application/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

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
          create: (context) => EventBloc(),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(),
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
          '/event-admin': (context) => const EventAdmin(),
          '/event-detail': (context) => const EventDetail(),
          '/event-category': (context) => const EventCategory(),
          '/event-create': (context) => CreateEvent(),
          '/event-create-admin': (context) => EventCreateAdmin(),
          '/choose-payment': (context) => ChoosePayment(),
          '/payment-success': (context) => PaymentSuccessPage(),
          '/snap': (context) => SnapScreen(),
        },
      ),
    );
  }
}
