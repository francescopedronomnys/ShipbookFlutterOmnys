import 'shipbook_flutter_omnys_platform_interface.dart';

class ShipbookFlutterOmnys {
  Future<void> start({required String appId, required String appKey}) {
    return ShipbookFlutterOmnysPlatform.instance
        .start(appId: appId, appKey: appKey);
  }

  Future<void> log(String message, {String tag = "-"}) {
    return ShipbookFlutterOmnysPlatform.instance
        .log(tag: tag, message: message);
  }
}
