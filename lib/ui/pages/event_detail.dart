import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/textmore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 12,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: whiteColor,
              ),
            ),
          ]),
      bottomNavigationBar: BottomAppBarCostum(),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        'assets/images/backgroundLogin.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 270,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 900,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Noah Concert',
                        style: blackTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Location(),
                      SizedBox(
                        height: 12,
                      ),
                      Time(),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(
                        thickness: 1,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Description',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextDescription(
                          text:
                              'THE GAME ON !!!\n\nBRING YOU TO THE STRONGEST SPLASH EVER AT THE VERY FIRST WATER FIGHTING EVENT IN INDONESIA !\n\nJTEAM PROJECT PRESENTING TO YOU\n\nFOR 10TH ANNIVERSARY OF BTS\n\n\"SUMMER SPLASH\" The Wettest Festival In Town\n\nWater Fighting, Dance, Music Performance, DJ Performance, Noraebang Party, BTS Birthday Celebrete with Fireworks'),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(
                        thickness: 1,
                        color: greyColor,
                      ),
                      TextDescription(
                          text:
                              'THE GAME ON !!!\n\nBRING YOU TO THE STRONGEST SPLASH EVER AT THE VERY FIRST WATER FIGHTING EVENT IN INDONESIA !\n\nJTEAM PROJECT PRESENTING TO YOU\n\nFOR 10TH ANNIVERSARY OF BTS\n\n\"SUMMER SPLASH\" The Wettest Festival In Town\n\nWater Fighting, Dance, Music Performance, DJ Performance, Noraebang Party, BTS Birthday Celebrete with Fireworks'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Location() {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: primaryColor,
          weight: 20,
          size: 24,
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lapangan Bung Karno',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View on Map',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget BottomAppBarCostum() {
    return BottomAppBar(
      child: Container(
        width: double.maxFinite,
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Noah Concert',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  'Rp. 100.000',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            CustomFilledButton(
              title: 'Buy Ticket',
              onPressed: () {},
              width: 100,
              height: 80,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget Time() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time,
          color: primaryColor,
          size: 24,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '22 Juni 2023',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        )
      ],
    );
  }
}
