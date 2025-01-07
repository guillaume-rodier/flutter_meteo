import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final String apiKey = dotenv.env['WEATHER_SERVICE_KEY'] ?? ''; // Get your API key on https://openweathermap.org/api
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error retrieving weather data');
    }
  }
}
