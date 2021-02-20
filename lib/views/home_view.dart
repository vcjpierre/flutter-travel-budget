import 'package:flutter/material.dart';
import 'package:flutter_travel_budget/models/Trip.dart';
import 'package:flutter_travel_budget/views/home_widgets/home_header.dart';
import 'package:flutter_travel_budget/views/home_widgets/trip_details_card.dart';

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
        ],
      ),
    );
  }
}