import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/data.dart';

Future<dynamic> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://private-8ce77c-tmobiletest.apiary-mock.com/test/home'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
