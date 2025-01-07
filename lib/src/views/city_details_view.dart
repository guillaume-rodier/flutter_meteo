import 'package:flutter/material.dart';

import '../models/city_item.dart';

/// Displays detailed information about a SampleItem.
class CityDetailsView extends StatelessWidget {
  const CityDetailsView({
    super.key,
    required this.city,
  });

  static const routeName = '/city_details';
  
  final City city;

  @override
  Widget build(BuildContext context) {
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
