import 'package:flutter/material.dart';
import 'package:flutter_travel_budget/models/Trip.dart';
import 'package:flutter_travel_budget/views/home_widgets/home_header.dart';
import 'package:flutter_travel_budget/views/home_widgets/trip_details_card.dart';
import 'home_widgets/current_daily_budget.dart';
import 'home_widgets/days_until_trip.dart';

class HomeView extends StatefulWidget {
  final Trip trip;

  HomeView({
    @required this.trip,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(widget.trip),
          TripDetailsCard(widget.trip),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: daysUntilTrip(context, widget.trip),
                  ),
                  Expanded(
                    child: currentDailyBudget(context, widget.trip),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}