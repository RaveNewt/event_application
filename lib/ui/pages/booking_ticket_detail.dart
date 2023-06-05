import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:flutter/material.dart';

class BookingTicketDetail extends StatefulWidget {
  final TransactionModel? data;
  const BookingTicketDetail({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<BookingTicketDetail> createState() => _BookingTicketDetailState();
}

class _BookingTicketDetailState extends State<BookingTicketDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Ticket'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          children: [
            Column(
              children: [
                Text(
                  'Ticket Number',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.data!.ticketNumber.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            CustomeDivider(),
            SizedBox(
              height: 24,
            ),
            TicketEventDetail(),
            SizedBox(
              height: 24,
            ),
            CustomeDivider(),
            SizedBox(
              height: 24,
            ),
            BuyerInformation(),
            CustomeDivider(),
          ]),
    );
  }

  Widget TicketEventDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Attendee',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.data!.username.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event Name',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.data!.title.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              ConvertDate(widget.data!.date.toString()),
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.data!.location.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget BuyerInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buyer Information',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.data!.username.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.data!.email.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
