import 'dart:io';
import 'package:flutter_config/flutter_config.dart';

class EnviornmentConfig {
  static String? get httpEndpoint => FlutterConfig.get('HTTP_ENDPOINT');

  static String? get webSocketEndpoint => FlutterConfig.get('WS_ENDPOINT');

  static String? get mapApiKey {
    if (Platform.isAndroid) {
      return FlutterConfig.get('ANDROID_MAP_KEY');
    }
    return FlutterConfig.get('IOS_MAP_KEY');
  }
}
