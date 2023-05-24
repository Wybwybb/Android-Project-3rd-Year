import 'package:http/http.dart' as http;

class Connection {
  final String serverUrl = 'http://172.19.130.134:5000';

  Future<String> getLoginData(String password) async {
    final String loginUrl = '$serverUrl/login?password=$password';
    final response = await http.get(Uri.parse(loginUrl));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to retrieve login data.');
    }
  }

  Future<List<String>> getQuestions() async {
    const String questionsUrl = 'https://172.19.130.134:5000/getquestions';
    final response = await http.get(Uri.parse(questionsUrl));

    if (response.statusCode == 200) {
      // Assuming the server responds with a list of question strings
      return response.body.split('\n');
    } else {
      throw Exception('Failed to retrieve questions.');
    }
  }
}
