import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class twoPage extends StatefulWidget {
  const twoPage({super.key});

  @override
  createState() => _MyHomePageState();
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class _MyHomePageState extends State<twoPage> {
  String connectionStatus = "---";

  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("new connectivity status: $result");
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity Plus"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(greeting()),
            ElevatedButton(
              onPressed: checkStatus,
              child: Text('Check Internet Status'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              connectionStatus,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  void checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("connected to a mobile network");
      setState(() {
        connectionStatus = "connected to a mobile network";
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("connected to a wifi network");
      setState(() {
        connectionStatus = "connected to a wifi network";
      });
    }
  }
}
