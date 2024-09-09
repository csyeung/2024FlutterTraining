import 'package:flutter/material.dart';

import 'network/network_data_provider.dart';

// こちらが　MyHomePage
// StatefulWidget に関しても後で説明するよ！！！！！
class MyHomePage extends StatefulWidget {
  // title を受け取ってるね👀
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterMultiple = 1;
  String networkData = '';

  void _incrementCounter() {
    setState(() async {
      networkData = await fetchAPIdata();
    });
  }

  void _multiplyCounter() {
    setState(() {
      _counterMultiple *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold は土台みたいな感じ（白紙みたいな）
    return Scaffold(
      // AppBar は上のヘッダー
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Center で真ん中寄せ
      body: Center(
        // Column は [] の中身を縦に並べてくれる widget
        // Row で横になるよ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              networkData,
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$_counterMultiple',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      // 右下のプラスボタン（Floating Action Button と言います）
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _multiplyCounter,
            tooltip: 'Multiplication',
            child: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
