import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/city_notifier.dart';

/// Displays detailed information about a SampleItem.
class AddCityView extends ConsumerWidget {
  const AddCityView({super.key});

  static const routeName = '/add_city';

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    String citiesName = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a city'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
            margin: EdgeInsets.all(20.0),  // Applies a margin around the Column
              child: TextField(
                onChanged: (text) {
                  citiesName = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a city name',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                ref.read(cityProvider.notifier).addCity(citiesName);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text("Add a city"),
            ),
          ),
        ],
      ),
    );
  }
}
