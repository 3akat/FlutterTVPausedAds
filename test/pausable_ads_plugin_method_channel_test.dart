import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pausable_ads_plugin/pausable_ads_plugin_method_channel.dart';

void main() {
  MethodChannelPausableAdsPlugin platform = MethodChannelPausableAdsPlugin();
  const MethodChannel channel = MethodChannel('pausable_ads_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
