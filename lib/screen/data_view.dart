import 'package:flutter/material.dart';
import 'package:flutter_sample_2024/model/response.dart';

class DataView extends StatelessWidget {
  const DataView({super.key, required this.response});

  final GithubResponse response;

  @override
  Widget build(BuildContext context) {
    if (response.items == null) {
      return const Center(
        child: Text('データありません'),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('カウント: ${response.totalCount}'),
        Expanded(
          child: ListView.builder(
            itemCount: response.items?.length,
            itemBuilder: (context, index) {
              final data = response.items?[index];
              final avatarUrl = data?.owner?.avatarUrl;

              return ListTile(
                leading: (avatarUrl != null)
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl),
                      )
                    : null,
                title: Text(data?.name ?? '----'),
                subtitle: Text(data?.description ?? '----'),
                onTap: () {
                  // Handle tile tap
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
