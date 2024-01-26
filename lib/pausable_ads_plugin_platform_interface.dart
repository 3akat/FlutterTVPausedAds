import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pausable_ads_plugin_method_channel.dart';
import 'widgets/player_view.dart';

abstract class PausableAdsPluginPlatform extends PlatformInterface {
  /// Constructs a PausableAdsPluginPlatform.
  PausableAdsPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PausableAdsPluginPlatform _instance = MethodChannelPausableAdsPlugin();

  /// The default instance of [PausableAdsPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPausableAdsPlugin].
  static PausableAdsPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PausableAdsPluginPlatform] when
  /// they register themselves.
  static set instance(PausableAdsPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void adAdsLoader(AdsPlayerView playerView, bool? skipped) {
    throw UnimplementedError('adAdsLoader() has not been implemented.');
  }
}
