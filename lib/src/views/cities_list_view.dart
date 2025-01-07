import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/settings_view.dart';
import 'city_details_view.dart';
import 'add_city_view.dart';

import '../models/city_notifier.dart';

/// Displays a list of SampleItems.
class CitiesListView extends ConsumerWidget {
  const CitiesListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(cityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cities list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.

      body: Column(
        children: [
          Expanded(
            child: cities.isEmpty
              ? Center(
                  child: Container(
                    margin: EdgeInsets.all(20.0),  // Applies a margin around the Column
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
                      crossAxisAlignment: CrossAxisAlignment.center,  // Center horizontally
                      children: <Widget>[
                        Text(
                          'No cities available.',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center
                        ),
                        SizedBox(height: 10), // Spacing between lines
                        Text(
                          'Please add one by clicking the button at the bottom of the page.',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index) {
                  final city = cities[index];

                  return ListTile(
                    title: Text(city.name),
                    leading: const CircleAvatar(
                      // Display the Flutter Logo image asset.
                      foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                    ),
                    onTap: () {
                      Navigator.restorablePushNamed(
                        context,
                        CityDetailsView.routeName,
                        arguments: city.toJson(),
                      );
                    }
                  );
                },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(
                  context,
                  AddCityView.routeName,
                );
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
