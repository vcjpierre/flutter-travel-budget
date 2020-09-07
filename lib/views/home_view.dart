import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_travel_budget/widgets/provider_widget.dart';
import 'package:flutter_travel_budget/models/Trip.dart';
import 'package:flutter_travel_budget/widgets/calculator_widget.dart';
import 'package:flutter_travel_budget/widgets/trip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_travel_budget/services/admob_service.dart';
import 'package:flutter_travel_budget/views/new_trips/location_view.dart';
import 'package:flare_flutter/flare_actor.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future _nextTrip;
  final ams = AdMobService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _nextTrip = _getNextTrip();
  }

  @override
  void initState() {
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _nextTrip,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              // Display Welcome
              return showNewTripPage();
            } else {
              return showHomePageWithTrips(snapshot.data);
            }
          } else {
            return Text("Loading...");
          }
        },
      ),
    );
  }

  Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
      BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('trips')
        .orderBy('startDate')
        .snapshots();
  }

  _getNextTrip() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    var snapshot = await Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('trips')
        .orderBy('startDate')
        .limit(1)
        .getDocuments();
    return Trip.fromSnapshot(snapshot.documents.first);
  }

  Widget showHomePageWithTrips(Trip trip) {
    return Column(
      children: <Widget>[
        CalculatorWidget(trip: trip),
        AdmobBanner(
          adUnitId: ams.getBannerAdId(),
          adSize: AdmobBannerSize.FULL_BANNER,
        ),
        Expanded(
          child: StreamBuilder(
            stream: getUsersTripsStreamSnapshots(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
              return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                  buildTripCard(context, snapshot.data.documents[index])
              );
            }
          ),
        ),
      ],
    );
  }

  Widget showNewTripPage() {
    final newTrip = new Trip(null, null, null, null, null, null);
    return Column(
      children: <Widget>[
        Container(
          color: Color(0xff92D2F2),
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width,
          child: FlareActor("assets/sun_clouds.flr",
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            animation: "do_animation",
          ),
        ),
        Container(
          color: Color(0xff57AEAF),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Create Your First Trip",
                  style: GoogleFonts.acme(
                    fontSize: 35.0, 
                    color: Provider.of(context).colors.text1
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Color(0xff57AEAF)
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          NewTripLocationView(trip: newTrip),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xffFAB76A),
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}