import 'package:event_application/bloc/event/event_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/card.dart';
import 'package:event_application/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  EventBloc? eventBloc;

  @override
  void initState() {
    eventBloc = BlocProvider.of<EventBloc>(context);
    eventBloc!.add(GetAllEvent());
    //searchFoodBloc.add(TextChanged(query: ))
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        children: [
          CustomSearchForm(
            hintText: "Music Event, webinar...",
            icon: Icon(Icons.search),
            onTap: () {
              showSearch(
                  context: context,
                  delegate: EventSearch(
                      searchBloc: BlocProvider.of<EventBloc>(context)));
            },
          ),
          SizedBox(
            height: 12,
          ),
          ListCard()
        ],
      ),
    );
  }

  Widget ListCard() {
    return BlocProvider(
      create: (context) => EventBloc()..add(GetAllEvent()),
      child: BlocBuilder<EventBloc, EventState>(builder: (context, state) {
        if (state is EventSuccess) {
          return GridView.count(
              padding: EdgeInsets.zero,
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

class EventSearch extends SearchDelegate<List> {
  EventBloc searchBloc;
  EventSearch({required this.searchBloc});
  String? queryString;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, []);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(SearchEventName(query));
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventSuccess) {
          if (state.events.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }
          return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
              crossAxisSpacing: 12,
              children: state.events.map((event) {
                return CostumCard(
                  event: event,
                );
              }).toList());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
