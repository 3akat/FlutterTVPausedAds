import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pausable_ads_plugin/widgets/player_view.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isPaused = false;
  bool _startPoint = true;
  late AdsPlayerView playerView;
  late VideoPlayerController _controller;
  PlayerViewController? _player_controller;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://storage.googleapis.com/gvabox/media/samples/stock.mp4'))
      ..initialize().then(
        (_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(
            () {},
          );
        },
      );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    playerView = AdsPlayerView(
      onPlayerViewCreated: _onPlayerViewCreated,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Video Demo'),
        ),
        body: Stack(
            alignment: AlignmentDirectional.center,
            children: {
              Visibility(
                visible: !_startPoint,
                child: playerView,
              ),
              Visibility(
                  visible: _startPoint || _controller.value.isPlaying,
                  child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller))),
            }.toList()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onPausePlay();
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  void _onPlayerViewCreated(PlayerViewController controller) {
    _player_controller = controller;
    controller.addPausedAds();
  }

  void onPausePlay() {
    setState(
      () {
        if (!_controller.value.isCompleted) {
          if (_controller.value.isPlaying) {
            _startPoint = false;
            _isPaused = true;
            _controller.pause();
          } else {
            _isPaused = false;
            _controller.play();
          }
        }
      },
    );
    print("onPausePlay");
    if (_isPaused && _player_controller != null) {
      print("start ads");
      _player_controller!.addPausedAds();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
