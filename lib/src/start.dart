import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:lance/config/app_config.dart';
import 'package:lance/providers.dart';
import 'package:lance/shared/services/services.dart';
import 'package:lance/src/app.dart';

import 'core/core.dart';

Future<Widget> bootstrap({required String flavorName, required String baseUrl,
  required String appName, required PendingDynamicLinkData? initialLink}) async {
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    final err = '${record.level.name}: ${record.time}: ${record.message}';
    debugPrint(err);
    if (record.level >= Level.SEVERE) {
      FirebaseCrashlytics.instance
          .recordError(record.error, record.stackTrace, reason: record.message);
    }
  });
  Environments environment = Environments.live;

  final secureCacheService = SecureCacheService.instance();
  final bool isAuthToken = await secureCacheService.getAuthToken();
  final HttpService httpService = HttpService(baseUrl, addHeaders: isAuthToken);
  final ApiService apiService = ApiService(httpService);

  return AppConfig(
      appName: appName,
      flavorName: flavorName,
      apiBaseUrl: baseUrl,
      environment: environment,
      child: ScreenUtilInit(
        builder: (context, child) => MultiProvider(
          providers: getProviders(apiService: apiService),
          child: App(key: const Key("App"), isToken: isAuthToken),
        ),
      )
  );


}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    // await setupFlutterNotifications();
  }
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //print('Handling a background message ${message.messageId}');
}

bool isFlutterLocalNotificationsInitialized = false;
/// Create a [AndroidNotificationChannel] for heads up notifications


/// Initialize the [FlutterLocalNotificationsPlugin] package.

Future<FirebaseCrashlytics> loadCrashlytics() async {
  final crashlytics = FirebaseCrashlytics.instance;
  await crashlytics.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = crashlytics.recordFlutterError;
  return crashlytics;
}

Future<FirebaseAnalytics> loadAnalytics() async {
  final analytics = FirebaseAnalytics.instance;
  await analytics.setAnalyticsCollectionEnabled(true);
  return analytics;
}