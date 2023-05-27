import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/card.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Scaffold(
          backgroundColor: bglight,
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              children: [
                Header(context),
                CustomSearchForm(
                  hintText: "Music Event, webinar...",
                  icon: Icon(Icons.search),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/event_concert');
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icon_concert.png',
                            width: 64,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Concert',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/event_concert');
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icon_webinar.png',
                            width: 64,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Webinar',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Event',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                CustomeDivider(),
                SizedBox(
                  height: 12,
                ),
                ListCard(),
              ]),
        );
      }
      return Container();
    });
  }

  Widget Header(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            color: whiteColor,
            margin: EdgeInsets.only(bottom: 24),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.data.username.toString(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_image.png'),
                      ),
                    ),
                  ),
                ]),
          );
        }
        return Container();
      },
    );
  }

  Widget ListCard() {
    return BlocProvider(
      create: (context) => EventBloc()..add(GetAllEvent()),
      child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
        if (state is EventSuccess) {
          return GridView.count(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8,
              children: state.events.map((event) {
                return CostumCard(
                  event: event,
                );
              }).toList());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
