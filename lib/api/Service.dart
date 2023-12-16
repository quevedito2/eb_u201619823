import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  static const String baseUrl =
      'https://www.superheroapi.com/api.php/595812947742582/search';

  Future<List<Map<String, dynamic>>> searchSuperhero(String query) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$query'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['results']);
      } else {
        throw Exception('Failed to load superheroes');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to perform the superhero search');
    }
  }
}
