import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class AddCityView extends StatelessWidget {
  const AddCityView({super.key});

  static const routeName = '/add_city';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a city'),
      ),
      body: const Center(
        child: Text('Page created to add a city'),
      ),
    );
  }
}
