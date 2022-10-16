import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

// void main() => runApp(webView());

// class webView extends StatefulWidget {
//   late WebViewController _controller;

//   @override
//   State<webView> createState() => _webViewState();
// }

// void main() => runApp(webView());

// class _webViewState extends State<webView> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Webview',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Web View'),
//         ),
//         body: Center(
//             child: WebView(
//           initialUrl: 'https://stackoverflow.com/',
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {},
//         )),
//       ),
//     );
//   }
// }

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
        ),
        body: Center(
            child: WebView(
          initialUrl: 'https://stackoverflow.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {},
        )),
      );
}
