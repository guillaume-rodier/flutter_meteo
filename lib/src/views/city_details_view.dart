import 'package:flutter/material.dart';

import '../models/city_item.dart';

/// Displays detailed information about a SampleItem.
class CityDetailsView extends StatelessWidget {
  const CityDetailsView({
    super.key,
    required this.city,
    required this.weather,
  });

  static const routeName = '/city_details';
  
  final City city;
  final dynamic weather;

  @override
  Widget build(BuildContext context) {
    print('---- Weather ----');
    print(weather);

    return Scaffold(
      appBar: AppBar(
        title: Text('${city.name} Details'),
      ),
      body: Center(
        child: Text('More informations from ${city.name} here'),
      ),
    );
  }
}
