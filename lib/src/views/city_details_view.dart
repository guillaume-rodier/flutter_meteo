import 'package:flutter/material.dart';

import '../models/city_item.dart';

/// Displays detailed information about a SampleItem.
class CityDetailsView extends StatelessWidget {
  const CityDetailsView({
    super.key,
    required this.city,
    required this.snapshot,
  });

  static const routeName = '/city_details';
  
  final City city;
  final dynamic snapshot;

  dynamic getWeatherViewBody() {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator()); // Show a loader while waiting;
    } else if (snapshot.hasError) {
      return Center(child: Text('Erreur: ${snapshot.error}'));
    } else if (snapshot.hasData) {
      // If the call succeeds, pass the data to the view
      return Center(
        child: Text('More informations from ${city.name} here'),
      );
    } else {
      return Center(child: Text('Aucune donnée disponible'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${city.name} Details'),
      ),
      body: getWeatherViewBody(),
    );
  }
}
 