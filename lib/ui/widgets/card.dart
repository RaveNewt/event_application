import 'package:event_application/models/event_model.dart';
import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/booking_ticket_detail.dart';
import 'package:event_application/ui/pages/event_admin_detail.dart';
import 'package:event_application/ui/pages/event_detail.dart';
import 'package:event_application/ui/pages/update_event.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:flutter/material.dart';

class CostumCard extends StatelessWidget {
  final EventModel event;
  const CostumCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetail(
              event: event,
            ),
          ),
        );
      },
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: 400,
            height: 1000,
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 4), // changes position of shadow
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: event.cover == null
                            ? AssetImage('assets/images/cover.png')
                            : NetworkImage(ImageURl() + event.cover!)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title!,
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          event.category!,
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          event.price == 0
                              ? 'Gratis'
                              : formatCurrency(event.price!),
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }
}

class CostumCardAdmin extends StatelessWidget {
  final EventModel event;
  const CostumCardAdmin({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetaiAdmin(
              eventadmin: event,
            ),
          ),
        );
      },
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: 400,
            height: 1000,
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 4), // changes position of shadow
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: event.cover == null
                            ? AssetImage('assets/images/cover.png')
                            : NetworkImage(ImageURl() + event.cover!)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title!,
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          event.category!,
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          event.price == 0
                              ? 'Gratis'
                              : formatCurrency(event.price!),
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }
}

class CustomeTicketCrad extends StatelessWidget {
  final TransactionModel data;
  const CustomeTicketCrad({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 4), // changes position of shadow
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '1 Ticket',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomeDivider(),
            CustomFilledButton(
              title: 'Lihat Tiket',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingTicketDetail(
                      data: data,
                    ),
                  ),
                );
              },
              color: primaryColor,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
