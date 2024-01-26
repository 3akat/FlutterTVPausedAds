import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pausable_ads_plugin_platform_interface.dart';
import 'widgets/player_view.dart';

/// An implementation of [PausableAdsPluginPlatform] that uses method channels.
class MethodChannelPausableAdsPlugin extends PausableAdsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pausable_ads_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void adAdsLoader(AdsPlayerView playerView, bool? skipped) async {
    await methodChannel.invokeMethod<String>('adAdsLoader', {
      'skipped': skipped,
      'playerView': playerView,
      'pauseCallback': skipped,
      'resumeCallback': skipped
    });
  }
}
