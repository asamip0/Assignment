import 'dart:convert';
import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class onePage extends StatefulWidget {
  const onePage({super.key});

  @override
  State<onePage> createState() => _onePageState();
}

fetchData() async {
  var url;
  url = await http.get(Uri.parse("https://api.publicapis.org/entries"));
  return jsonDecode(url.body)['entries'];
}

class _onePageState extends State<onePage> {
  List incomingData = [];
  String buttonText = "Fetch data";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: incomingData.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(incomingData[index]['API']),
                      );
                    },
                    itemCount: incomingData.length,
                  )
                : TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 18, 44, 65)),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.blue.withOpacity(0.12);
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      print("sending request");
                      setState(() {
                        buttonText = "Fetching data from api ...";
                      });

                      fetchData().then((response) {
                        print('entries response');
                        setState(() {
                          incomingData = response;
                          buttonText = "Fetch data";
                        });
                      });
                    },
                    child: Text(buttonText),
                  ),
          ),
        ),
      ),
    );
  }
}
