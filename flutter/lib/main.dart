import 'package:flutter/material.dart';
import 'package:watchtower/watchtower.dart';

// Publishable keys are public by design: flutter run --dart-define=WT_PUBLISHABLE_KEY=wtp_...
const _key = String.fromEnvironment('WT_PUBLISHABLE_KEY');
const _endpoint = String.fromEnvironment('WT_OTLP_ENDPOINT', defaultValue: 'http://localhost:4318');

Future<void> main() async {
  // Installs FlutterError.onError, PlatformDispatcher.onError and a guarded zone.
  await Watchtower.run(
    options: const WatchtowerOptions(publishableKey: _key, endpoint: _endpoint, service: 'flutter-example'),
    appRunner: () => runApp(const ExampleApp()),
  );
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ElevatedButton(
                onPressed: () => Watchtower.captureError(StateError('boom from the Flutter example')),
                child: const Text('Capture error'),
              ),
              ElevatedButton(
                onPressed: () => throw StateError('uncaught from the Flutter example'),
                child: const Text('Throw (uncaught)'),
              ),
            ]),
          ),
        ),
      );
}
