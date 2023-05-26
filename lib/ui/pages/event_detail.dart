import 'dart:ffi';
import 'dart:ui';

import 'package:event_application/models/event_model.dart';
import 'package:event_application/models/user_model.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/choose_payment.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/textmore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class EventDetail extends StatefulWidget {
  final EventModel? event;
  const EventDetail({
    Key? key,
    this.event,
  }) : super(key: key);

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
            onPressed: () {
              Navigator.pop(context);
            },
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.event!.cover == null
                          ? AssetImage(
                              'assets/images/backgroundLogin.png',
                            )
                          : NetworkImage(ImageURl() + widget.event!.cover!)
                              as ImageProvider,
                      fit: BoxFit.fitWidth,
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
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event!.title!,
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
                      Row(
                        children: [
                          Icon(
                            Icons.airplane_ticket,
                            color: primaryColor,
                          ),
                          Text(
                            "Stock: ",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          ),
                          Text(
                            widget.event!.stock.toString(),
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold),
                          ),
                        ],
                      ),
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
                      TextDescription(text: '${widget.event!.about}'),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(
                        thickness: 1,
                        color: greyColor,
                      ),
                      SomeThingWrong(),
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
              widget.event!.location!,
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
          borderRadius: BorderRadius.vertical(
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
                  widget.event!.title!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  formatCurrency(widget.event!.price!),
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            CustomFilledButton(
              title: 'Buy Ticket',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoosePayment(
                      event: widget.event,
                    ),
                  ),
                );
              },
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
          ConvertDate(widget.event!.date!),
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        )
      ],
    );
  }

  Widget SomeThingWrong() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          "Something Wrong?",
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Icon(
              Icons.info,
              color: dangerColor,
              size: 16,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Report This content",
              style: dangerTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "if any problem occur feel free to check our help center",
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Text(
              "Contact Us: ",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            Text(
              "Eventify@gmail.com",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
