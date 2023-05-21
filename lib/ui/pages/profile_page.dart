import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:event_application/ui/widgets/item_list.dart';
import 'package:flutter/material.dart';

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
      SettingList(),
      CustomeDivider(),
      CreateEvent(),
    ]));
  }

  Widget Header() {
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
                  'Ihsanulisra',
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

  Widget SettingList() {
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
          onPressed: () {},
        ),
      ],
    );
  }

  Widget CreateEvent() {
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
          onPressed: () {},
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
