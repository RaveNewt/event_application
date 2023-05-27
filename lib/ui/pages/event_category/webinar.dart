import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventWebinar extends StatelessWidget {
  final String categoryConcert;

  const EventWebinar(
      {this.categoryConcert = '645a5660559f72d4a40d8465', super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Concert',
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
        children: [ListCard()],
      ),
    );
  }

  Widget ListCard() {
    return BlocProvider(
      create: (context) => EventBloc()..add(EventGetCategory(categoryConcert)),
      child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
        if (state is EventSuccess) {
          return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8,
              children: state.events.map((event) {
                return CostumCard(
                  event: event,
                );
              }).toList());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
