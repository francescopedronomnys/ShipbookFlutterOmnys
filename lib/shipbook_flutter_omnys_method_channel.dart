import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'shipbook_flutter_omnys_platform_interface.dart';

/// An implementation of [ShipbookFlutterOmnysPlatform] that uses method channels.
class MethodChannelShipbookFlutterOmnys extends ShipbookFlutterOmnysPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('shipbook_flutter_omnys');

  @override
  Future<void> start({required String appId, required String appKey}) async {
    final List<dynamic> args = <dynamic>[appId, appKey];
    return methodChannel.invokeMethod<void>('Shipbook.start', args);
  }

  @override
  Future<void> log({required String tag, required String message}) {
    final List<dynamic> args = <dynamic>[tag, message];
    return methodChannel.invokeMethod<void>('Shipbook.log', args);
  }
}
