import 'package:http/http.dart' as http;

Future<String> fetchAPIdata() async {
  final response = await http.get(
    Uri.https('api.github.com', '/users/psycohk/repos'),
  );

  return response.body;
}
