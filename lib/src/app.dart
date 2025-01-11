import 'package:event_bus/event_bus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' hide Priority;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lance/config/app_config.dart';
import 'package:lance/src/routes.dart';
import 'package:lance/src/views/screens/dashboard_screen.dart';
import 'package:lance/src/views/screens/signup_screen.dart';
import 'package:lance/utils/utils.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'mixins/app_mixins.dart';
import 'mixins/misc_mixins.dart';

class App extends StatefulWidget {
  App({required Key key, required this.isToken, this.dynamicLinkData})
      : super(key: key);
  bool isToken = false;
  PendingDynamicLinkData? dynamicLinkData;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>
    with
        MiscMixin,
        WidgetsBindingObserver {
  final Logger _logger = Logger("AppState");

  String? _token;
  String? initialMessage;
  bool _resolved = false;
  late Stream<String> _tokenStream;


  void setToken(String? token) {
    setState(() {
      _token = token;
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // checkForUpdate();
    });
  }

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String appName = "Vircap";

  /// Create a [AndroidNotificationChannel] for heads up notifications
  // late AndroidNotificationChannel channel;

  bool isFlutterLocalNotificationsInitialized = false;


  void _handleMessage(RemoteMessage message) {
    final eventBus = context.watch<EventBus>();
    if (message.data['eventType'] == 'new-trade') {
      //   Navigate to another page
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);
    // retrieveDynamicLink(widget.dynamicLinkData)
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: config!.appName,
      builder: EasyLoading.init(),
      theme: LanceThemes.defaultTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder()
          },
        ),
      ),
      home: const SignupScreen(),
      routes: LanceRoutes.defaultRoutes,
    );
  }

  Widget _getHomeWidget() {
    return const DashboardScreen();
  }

  Future getDeviceToken() async {
    //request user permission for push notification
    // FirebaseMessaging.instance.requestPermission();
    // FirebaseMessaging firebaseMessage = FirebaseMessaging.instance;
    // String? deviceToken = await firebaseMessage.getToken();
    // return (deviceToken == null) ? "" : deviceToken;
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with AppMixin {
  // final UserResponseDTO? user;
  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
