import 'package:flutter_meteo/src/models/city_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityNotifier extends StateNotifier<List<City>> {
  // CityNotifier() : super([City(id: DateTime.now().toString(), name: 'Paris'), City(id: DateTime.now().toString(), name: 'Londres')]);
  CityNotifier() : super([]);

  // Add a city
  void addCity(String name) {
    state = [...state, City(id: DateTime.now().toString(), name: name)];
  }

  // Remove a city
  void removeCity(String id) {
    state = state.where((city) => city.id != id).toList();
  }

  // Update a city
  void updateCity(String id, String newName) {
    state = state.map((city) {
      if (city.id == id) {
        return City(id: city.id, name: newName);
      }
      return city;
    }).toList();
  }
}

// Create a provider for the list
final cityProvider = StateNotifierProvider<CityNotifier, List<City>>((ref) {
  return CityNotifier();
});
