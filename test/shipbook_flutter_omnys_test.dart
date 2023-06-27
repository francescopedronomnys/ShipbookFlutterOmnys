import 'package:flutter_test/flutter_test.dart';
import 'package:shipbook_flutter_omnys/shipbook_flutter_omnys.dart';
import 'package:shipbook_flutter_omnys/shipbook_flutter_omnys_platform_interface.dart';
import 'package:shipbook_flutter_omnys/shipbook_flutter_omnys_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShipbookFlutterOmnysPlatform
    with MockPlatformInterfaceMixin
    implements ShipbookFlutterOmnysPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShipbookFlutterOmnysPlatform initialPlatform = ShipbookFlutterOmnysPlatform.instance;

  test('$MethodChannelShipbookFlutterOmnys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShipbookFlutterOmnys>());
  });

  test('getPlatformVersion', () async {
    ShipbookFlutterOmnys shipbookFlutterOmnysPlugin = ShipbookFlutterOmnys();
    MockShipbookFlutterOmnysPlatform fakePlatform = MockShipbookFlutterOmnysPlatform();
    ShipbookFlutterOmnysPlatform.instance = fakePlatform;

    expect(await shipbookFlutterOmnysPlugin.getPlatformVersion(), '42');
  });
}
