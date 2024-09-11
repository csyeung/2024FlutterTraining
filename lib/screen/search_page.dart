import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_2024/network/network_data_provider.dart';
import 'package:flutter_sample_2024/screen/data_view.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late String searchWord;

  @override
  void initState() {
    super.initState();
    searchWord = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github レポジトリ検索'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  searchWord = value;
                });
              },
              decoration: const InputDecoration(
                hintText: '検索ワードを入力してください',
              ),
            ),
            const Divider(),
            Expanded(
              child: ref.watch(apiDataListProvider(searchWord)).when(
                    data: (data) => DataView(response: data),
                    loading: () => const Column(children: [
                      RefreshProgressIndicator(),
                      Spacer(),
                    ]),
                    error: (error, __) => Column(
                      children: [
                        const Text('エラーが発生しました'),
                        Text(error.toString()),
                        const Spacer(),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
