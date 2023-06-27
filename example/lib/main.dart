import 'package:flutter/material.dart';
import 'package:shipbook_flutter_omnys/shipbook_flutter_omnys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _shipbookFlutterOmnysPlugin = ShipbookFlutterOmnys();

  @override
  void initState() {
    super.initState();
    _shipbookFlutterOmnysPlugin.start(
      appId: "YOUR_APP_ID", //TODO change me
      appKey: "YOUR_APP_KEY", //TODO change me
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shipbook Omnys Example'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Log something"),
            onPressed: () {
              _shipbookFlutterOmnysPlugin.log(
                  "Someone pressed a button at ${DateTime.now().toIso8601String()}");
            },
          ),
        ),
      ),
    );
  }
}
