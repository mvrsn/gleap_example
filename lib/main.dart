import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:shake/shake.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Gleap.initialize(token: 'GLEAP_KEY');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gleap Android Example',
      theme: ThemeData(
        //
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gleap Android Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
      super.initState();

      ShakeDetector.autoStart(
        onPhoneShake: () async {
          await Gleap.open();
          print('Gleap.open()');
        },
        shakeSlopTimeMS: 500,
        shakeCountResetTime: 3000,
        shakeThresholdGravity: 2.7,
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await MethodChannel('gleap_example',).invokeMethod('open');
          },
          child: Text('Open Native Activity'),
        ),
      ),
    );
  }
}
