
import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:lance/src/start.dart';
import 'package:lance/utils/utils.dart';

void main() async {
  String baseUrl = lanceBaseUrl;
  String flavorName = "production";
  String appName = "Lance";

  // Wraps `app` in a guarded zone where all errors are reported to `crashlytics.recordError`.
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final app = await bootstrap(baseUrl: baseUrl, initialLink: null,
        flavorName: flavorName, appName: appName);
    runApp(app);
  }, (error, stack) async {
    if (kReleaseMode) {
      final crashlytics = await loadCrashlytics();
      crashlytics.recordError(error, stack);
    }
  });
}
