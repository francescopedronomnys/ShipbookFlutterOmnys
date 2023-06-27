import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shipbook_flutter_omnys/shipbook_flutter_omnys_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelShipbookFlutterOmnys platform = MethodChannelShipbookFlutterOmnys();
  const MethodChannel channel = MethodChannel('shipbook_flutter_omnys');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
