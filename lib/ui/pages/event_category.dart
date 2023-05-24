import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/event_create.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class EventCategory extends StatefulWidget {
  // final List<String>? listCategory = <String>[
  //   'online',
  //   'offline',
  // ];

  const EventCategory({super.key});

  @override
  State<EventCategory> createState() => _EventCategoryState();
}

class _EventCategoryState extends State<EventCategory> {
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
                    'Pilih Jenis Event',
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
              Text(
                'Pilih Jenis Event yang akan dibuat:',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Card(
                semanticContainer: true,
                child: Center(
                  heightFactor: 1,
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    iconColor: primaryColor,
                    leading: Icon(Icons.video_camera_back),
                    title: Text('Online Event'),
                    subtitle: Text('Peserta menhadiri event secara online'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, '/event-create-admin');
                    },
                  ),
                ),
              ),
              Card(
                semanticContainer: true,
                child: Center(
                  heightFactor: 1,
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    iconColor: primaryColor,
                    leading: Icon(Icons.event),
                    title: Text('Onsite Event'),
                    subtitle: Text('Peserta menhadiri event langsung'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, '/event-create');
                    },
                  ),
                ),
              ),
            ]),
          ),
        ]));
    ;
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
          )
        ],
      ),
    );
  }
}
