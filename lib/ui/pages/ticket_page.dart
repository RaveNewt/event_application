import 'package:event_application/bloc/auth/auth_bloc.dart';
import 'package:event_application/bloc/transaction/transaction_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:event_application/ui/widgets/card.dart';
import 'package:event_application/ui/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return BlocProvider(
          create: (context) => TransactionBloc()
            ..add((GetBookingTicketNumber(state.data.id.toString()))),
          child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
            if (state is BookingSuccess) {
              return Scaffold(
                appBar: AppBar(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ticket',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                body: ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: 24),
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.8,
                      ),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) =>
                          CustomeTicketCrad(data: state.data[index]),
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
