import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/location.dart';
import 'package:event_application/ui/pages/search_location.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class EventAdmin extends StatefulWidget {
  const EventAdmin({super.key});

  @override
  State<EventAdmin> createState() => _EventAdminState();
}

class _EventAdminState extends State<EventAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerCustom(),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Eventify',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Manager Event',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('Logout'),
                    onTap: () {},
                  ),
                ];
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: ListView(children: [
          Container(
            child: Column(children: [
              Container(
                width: double.maxFinite,
                height: 100,
                color: greyColor,
                child: Center(
                  child: Text(
                    'Home',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomFilledButton(
                title: '+ Buat Event',
                onPressed: () {
                  Navigator.pushNamed(context, '/event-category');
                },
                width: 200,
                color: secondaryColor,
              ),
              SizedBox(
                height: 24,
              ),
              CustomFilledButton(
                title: '+ Lokasi',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SnapshotPage(),
                      ));
                },
                width: 200,
                color: secondaryColor,
              ),
            ]),
          ),
        ]));
  }

  Widget DrawerCustom() {
    return Drawer(
      backgroundColor: blackColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_image.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Center(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ihsan',
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold),
                      ),
                      Text(
                        'Admin',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Event',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Back To Eventify',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/navbar');
            },
          )
        ],
      ),
    );
  }
}
