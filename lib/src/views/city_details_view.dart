import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class CityDetailsView extends StatelessWidget {
  const CityDetailsView({super.key});

  static const routeName = '/city_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
