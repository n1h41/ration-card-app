import 'package:http/http.dart' as http;

const server_url = "http://10.0.2.2:3033";

class Webservice {
  Future loginUser(data) async {
    final url = "$server_url/login";
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: data,
    );
    return response;
  }

  Future registerUser(data) async {
    final url = "$server_url/register";
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: data,
    );
    return response;
  }
}
