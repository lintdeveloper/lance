import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  Future<Uri?> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      return deepLink;
    } catch (e) {
      if (kDebugMode) {
        //print(e.toString());
      }
    }
    return null;
  }
}