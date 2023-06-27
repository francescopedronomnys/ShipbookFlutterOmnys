import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'shipbook_flutter_omnys_method_channel.dart';

abstract class ShipbookFlutterOmnysPlatform extends PlatformInterface {
  /// Constructs a ShipbookFlutterOmnysPlatform.
  ShipbookFlutterOmnysPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShipbookFlutterOmnysPlatform _instance =
      MethodChannelShipbookFlutterOmnys();

  /// The default instance of [ShipbookFlutterOmnysPlatform] to use.
  ///
  /// Defaults to [MethodChannelShipbookFlutterOmnys].
  static ShipbookFlutterOmnysPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShipbookFlutterOmnysPlatform] when
  /// they register themselves.
  static set instance(ShipbookFlutterOmnysPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> start({required String appId, required String appKey}) {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<void> log({required String tag, required String message}) {
    throw UnimplementedError('log() has not been implemented.');
  }
}
