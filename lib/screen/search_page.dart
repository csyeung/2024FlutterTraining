import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_2024/network/network_data_provider.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  void search(WidgetRef ref, String searchWord) async {
    ref.read(apiDataListProvider(searchWord));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String searchWord = '';
    late List<String> searchResult = [];

    final provider = ref.watch(apiDataListProvider(searchWord));
    provider.hasValue
        ? searchResult = provider.asData!.value
        : searchResult = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                searchWord = value;
              },
              decoration: const InputDecoration(
                hintText: 'Search Word',
              ),
            ),
            ElevatedButton(
              onPressed: () => search(ref, searchWord),
              child: const Text('Search'),
            ),
            Text(
              searchResult.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
