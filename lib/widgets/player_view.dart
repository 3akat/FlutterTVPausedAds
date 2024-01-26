import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef void PlayerViewCreatedCallback(
    PlayerViewController controller);

class AdsPlayerView extends StatefulWidget {
  const AdsPlayerView({
    Key? key,
    required this.onPlayerViewCreated,
  }) : super(key: key);

  final PlayerViewCreatedCallback onPlayerViewCreated;

  @override
  State<StatefulWidget> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<AdsPlayerView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'ads_player_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'ads_player_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by the plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onPlayerViewCreated == null) {
      return;
    }
    widget.onPlayerViewCreated(PlayerViewController._(id));
  }
}

class PlayerViewController {
  PlayerViewController._(int id)
      : _channel = const MethodChannel('ads_player');

  final MethodChannel _channel;

  Future<void> addPausedAds() async {
    return _channel.invokeMethod('addPausedAds');
  }

}
