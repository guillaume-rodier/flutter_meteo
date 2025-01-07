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
      Map<String, dynamic> weather = snapshot.data;

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Temperature: ${weather['main']['temp']}°C',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Temperature felt: ${weather['main']['feels_like']}°C', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Minimum temperature: ${weather['main']['temp_min']}°C', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Maximum temperature: ${weather['main']['temp_max']}°C', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Humidity: ${weather['main']['humidity']}%', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Wind speed: ${weather['wind']['speed']} m/s', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Clouds: ${weather['clouds']['all']}', style: TextStyle(fontSize: 18)),
          ],
        ),
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
