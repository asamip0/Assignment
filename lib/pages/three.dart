import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class threePage extends StatefulWidget {
  const threePage({super.key});

  @override
  State<threePage> createState() => _threePageState();
}

class _threePageState extends State<threePage> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
          centerTitle: true,
        ),
        body: Center(
            child: WebView(
          initialUrl: 'https://stackoverflow.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {},
        )),
      );
}
