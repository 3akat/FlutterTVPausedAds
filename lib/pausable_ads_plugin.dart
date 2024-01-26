
import 'dart:ffi';

import 'package:pausable_ads_plugin/widgets/player_view.dart';

import 'pausable_ads_plugin_platform_interface.dart';

class PausableAdsPlugin {
  Future<String?> getPlatformVersion() {
    return PausableAdsPluginPlatform.instance.getPlatformVersion();
  }

  void adAdsLoader(AdsPlayerView playerView, bool? skipped) {
    return PausableAdsPluginPlatform.instance.adAdsLoader(playerView, skipped);
  }

}
