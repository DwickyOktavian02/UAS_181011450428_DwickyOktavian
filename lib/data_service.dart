import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nim_181011450428/weather_model.dart';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//appid = 065a6c613c40aceca6461d87fb608f5b

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      final queryParameter = {
        'q': cityName,
        "appid": '065a6c613c40aceca6461d87fb608f5b',
        'units': 'metric'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameter);
      final response = await http.get(uri);
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}