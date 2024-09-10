import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiDataListProvider = FutureProvider.autoDispose
    .family<List<String>, String>((ref, keyword) async {
  return NetworkDataProvider.fetchAPIdataList(keyword);
});

class NetworkDataProvider {
  static Future<String> fetchAPIdata() async {
    final response = await http.get(
      Uri.https('api.github.com', '/users/psycohk/repos'),
    );

    return response.body;
  }

  static Future<List<String>> fetchAPIdataList(String keyword) async {
    final response = await http.get(
      Uri.https(
        'api.github.com',
        '/search/repositories',
        {'q': '$keyword+in:name', 'sort': 'stars'},
      ),
    );

    final result = jsonDecode(response.body);

    return [result.toString()];
  }
}
