import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/event_detail.dart';
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
          appBar: AppBar(
              shadowColor: blackColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(12),
                child: Container(
                  color: Colors.white,
                  height: 1,
                ),
              ),
              automaticallyImplyLeading: false,
              titleSpacing: 2,
              backgroundColor: whiteColor,
              title: Header(context)),
          backgroundColor: bglight.withOpacity(0.3),
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              children: [
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
                        Navigator.pushNamed(context, '/event_webinar');
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
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                          fontWeight: superbold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(state.data.username.toString().toUpperCase(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: superbold,
                          )),
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
          return Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.events.length,
                itemBuilder: (context, index) =>
                    CostumCard(event: state.events[index]),
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
