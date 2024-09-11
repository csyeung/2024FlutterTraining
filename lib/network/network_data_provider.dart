import 'dart:convert';

import 'package:flutter_sample_2024/model/response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiDataListProvider = FutureProvider.autoDispose
    .family<GithubResponse, String>((ref, keyword) async {
  if (keyword == '') {
    return GithubResponse(items: []);
  }

  final url = Uri.https(
    'api.github.com',
    '/search/repositories',
    {'q': '$keyword+in:name', 'sort': 'stars'},
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return GithubResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data ${response.statusCode}');
  }
});
