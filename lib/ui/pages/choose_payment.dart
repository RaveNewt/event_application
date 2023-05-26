import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/bloc/transaction/transaction_bloc.dart';
import 'package:event_application/models/checkout_form.dart';
import 'package:event_application/models/event_model.dart';
import 'package:event_application/models/transaction_model.dart';
import 'package:event_application/models/user_model.dart';
import 'package:event_application/shared/helpers.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoosePayment extends StatefulWidget {
  final EventModel? event;
  const ChoosePayment({this.event, super.key});

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  String? selected;
  List<Map> list = [
    {
      'id': '1',
      'image': 'assets/gopay_logo.png',
      'name': 'Gopay',
    },
    {
      'id': '2',
      'image': 'assets/bni_logo.png',
      'name': 'BNI',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBarCostum(context),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Payment',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event Name:",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    widget.event!.title == null
                        ? "Makan"
                        : widget.event!.title!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomeDivider(),
            SelectBank(),
            SizedBox(
              height: 12,
            ),
            CustomeDivider(),
            PersonalInfo(context),
          ],
        ));
  }

  Widget PersonalInfo(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 25,
              color: greyColor,
              padding: EdgeInsets.only(left: 24),
              child: Text(
                "Personal Detail",
                style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(children: [
                CustomFormField(
                  controller: usernameController =
                      TextEditingController(text: state.data.user!.username),
                  title: "name",
                  isShowIcon: false,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomFormField(
                  controller: emailController =
                      TextEditingController(text: state.data.user!.email),
                  title: "email",
                  isShowIcon: false,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomFormField(
                  controller: TextEditingController(text: "Designer"),
                  title: "role",
                  isShowIcon: false,
                ),
              ]),
            )
          ],
        );
      }
      return Container();
    });
  }

  Widget SelectBank() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 25,
          color: greyColor,
          padding: EdgeInsets.only(left: 24),
          child: Text(
            "Select Payment",
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          padding: EdgeInsets.only(left: 24),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              buttonColor: primaryColor,
              highlightColor: primaryColor,
              alignedDropdown: true,
              child: DropdownButton(
                hint: Text("select Bank"),
                value: selected,
                items: list.map((bankItem) {
                  return DropdownMenuItem(
                      value: bankItem['id'].toString(),
                      child: Row(
                        children: [
                          Image.asset(
                            bankItem['image'],
                            width: 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(bankItem['name'].toString()),
                          ),
                        ],
                      ));
                }).toList(),
                onChanged: (value) {
                  // This is called when the user selects an item.
                  setState(() {
                    selected = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget BottomAppBarCostum(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
      if (state is TransactionSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/payment-success', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
      }
    }, builder: (context, State) {
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
                    'Total',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    formatCurrency(widget.event!.price!),
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              CustomFilledButton(
                title: 'Checkout',
                onPressed: () {
                  context.read<TransactionBloc>().add(
                        TrasactionCheckout(
                          CheckoutForm(
                            event: widget.event!.id,
                            username: usernameController.text,
                            email: emailController.text,
                            payment: "64705ede89eef52643720981",
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
    });
  }
}
