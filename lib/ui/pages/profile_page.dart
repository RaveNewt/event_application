import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:event_application/ui/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(children: [
              Text(
                'Profile',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: superbold,
                ),
              )
            ]),
          ),
        ],
      ),
      Header(),
      CustomeDivider(),
      SettingList(context),
      CustomeDivider(),
      CreateEvent(context),
    ]));
  }

  Widget Header() {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          margin: EdgeInsets.only(bottom: 24),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 98,
                  height: 98,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_image.png'),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      state.data.username.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 26,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomFilledButton(
                      title: 'Edit Profile',
                      onPressed: () {},
                      width: 250,
                      height: 40,
                    ),
                  ],
                ),
              ]),
        );
      }
      return Container();
    });
  }

  Widget SettingList(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthFailed) {
        showCustomSnackbar(context, state.e);
      }
      if (state is AuthInitial) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
    }, builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          Setting(
            title: 'History Payment',
            icon: Icon(
              Icons.history,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
          Setting(
            title: 'Setting',
            icon: Icon(
              Icons.settings,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
          Setting(
            title: 'Log Out',
            icon: Icon(
              Icons.logout,
              color: primaryColor,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogout());
            },
          ),
        ],
      );
    });
  }

  Widget CreateEvent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(children: [
        Text(
          'Want To create your event?',
          style: blackTextStyle.copyWith(
            fontSize: 13,
            fontWeight: light,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CustomFilledButton(
          title: 'create event',
          onPressed: () {
            Navigator.pushNamed(context, '/event-admin');
          },
          width: 100,
          height: 50,
          color: bgsecondary,
          fontSize: 12,
          borderRadius: 20,
        ),
      ]),
    );
  }
}
