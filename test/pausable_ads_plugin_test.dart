import 'package:flutter_test/flutter_test.dart';
import 'package:pausable_ads_plugin/pausable_ads_plugin.dart';
import 'package:pausable_ads_plugin/pausable_ads_plugin_platform_interface.dart';
import 'package:pausable_ads_plugin/pausable_ads_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPausableAdsPluginPlatform
    with MockPlatformInterfaceMixin
    implements PausableAdsPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PausableAdsPluginPlatform initialPlatform = PausableAdsPluginPlatform.instance;

  test('$MethodChannelPausableAdsPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPausableAdsPlugin>());
  });

  test('getPlatformVersion', () async {
    PausableAdsPlugin pausableAdsPlugin = PausableAdsPlugin();
    MockPausableAdsPluginPlatform fakePlatform = MockPausableAdsPluginPlatform();
    PausableAdsPluginPlatform.instance = fakePlatform;

    expect(await pausableAdsPlugin.getPlatformVersion(), '42');
  });
}
