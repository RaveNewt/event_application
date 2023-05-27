import 'package:event_application/bloc/transaction/transaction_bloc.dart';
import 'package:event_application/bloc/xendit/xendit_bloc.dart';
import 'package:event_application/models/xendit_form.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String amountController = '';
  String emailController = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
      if (state is TransactionSuccess) {
        return Scaffold(
          bottomNavigationBar: BottomAppBarCostum(context),
          backgroundColor: bglight,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Checkout',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transaction Id:",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    state.data.id.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
              CustomeDivider(),
              SizedBox(
                height: 12,
              ),
              Text(
                "Detail",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              CustomeDivider(),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Username:",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: superbold,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    state.data.username.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Email:",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: superbold,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    emailController = state.data.email.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Event Name:",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: superbold,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    state.data.title.toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Amount:",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: superbold,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    amountController = state.data.price.toString(),
                    style: dangerTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }

  Widget BottomAppBarCostum(BuildContext context) {
    return BlocConsumer<XenditBloc, XenditState>(listener: (context, state) {
      if (state is XenditSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/xendit-url', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/xendit-url', (route) => false);
      }
    }, builder: (context, state) {
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
          child: CustomFilledButton(
            title: 'Make UrlPayment',
            onPressed: () {
              context.read<XenditBloc>().add(
                    XenditInvoice(
                      XenditForm(
                        external_id:
                            'Invoice-${DateTime.now().millisecondsSinceEpoch}',
                        amount: amountController,
                        payer_email: emailController,
                        description: "Invoice Demo #123",
                      ),
                    ),
                  );
            },
            width: 100,
            height: 80,
            fontSize: 12,
          ),
        ),
      );
    });
  }
}
