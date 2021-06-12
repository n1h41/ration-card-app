import 'package:http/http.dart' as http;

import '../globals.dart';

class Webservice {
  Future loginUser(data) async {
    final url = Uri.parse('$host/authentication/sign-in');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: data,
    );
    return response;
  }

  Future registerUser(data) async {
    final url = Uri.parse('$host/authentication/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: data,
    );
    return response;
  }
}
