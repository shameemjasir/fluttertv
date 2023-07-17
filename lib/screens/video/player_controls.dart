import 'package:flutter/material.dart';
import 'package:fluttertv/utils/action_handler.dart';
import 'package:fluttertv/widgets/icon_button.dart';
import 'package:video_player/video_player.dart';

class PlayerControls extends StatefulWidget {
  const PlayerControls({super.key});

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  late VideoPlayerController _controller;
  String videoDuration = "";
  String videoCurrentTime = "";

  FocusNode? _playFocusNode;
  FocusNode? _stopFocusNode;
  FocusNode? _forwardFocusNode;
  FocusNode? _BackwardFocusNode;
  FocusNode? _previousScreen;

  @override
  void initState() {
    super.initState();
    loadVideoPlayer1();
  }

  void _setFirstFocus(BuildContext context) {
    if (_playFocusNode == null) {
      _playFocusNode = FocusNode();
      _stopFocusNode = FocusNode();
      _forwardFocusNode = FocusNode();
      _BackwardFocusNode = FocusNode();
      _previousScreen = FocusNode();
    }
    FocusScope.of(context).requestFocus(_playFocusNode);
  }

  _changeFocus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _playFocusNode = FocusNode();
    _stopFocusNode = FocusNode();
    _forwardFocusNode = FocusNode();
    _BackwardFocusNode = FocusNode();
    _previousScreen = FocusNode();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_playFocusNode == null) {
      _setFirstFocus(context);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ActionHandler().handleArrowsandEnterActions(
          child: _controller.value.isInitialized
              ? Stack(children: [
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                  Positioned(
                    left: 10,
                    child: Actions(
                      actions: <Type, Action<Intent>>{
                        EnterButtonIntent: CallbackAction<EnterButtonIntent>(
                            onInvoke: (Intent) {
                          return Navigator.pop(context);
                        }),
                        RightButtonIntent: CallbackAction<RightButtonIntent>(
                            onInvoke: (Intent) {
                          return _changeFocus(context, _BackwardFocusNode!);
                        }),
                        DownButtonIntent: CallbackAction<DownButtonIntent>(
                            onInvoke: (Intent) {
                          return _changeFocus(context, _playFocusNode!);
                        }),
                      },
                      child: Focus(
                        focusNode: _previousScreen,
                        child: IconButtonSection(
                          size: 30,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icons.arrow_back,
                          iconColor: !_previousScreen!.hasFocus
                              ? Colors.blue
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 45,
                    right: 10,
                    child: Text(
                      videoDuration,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    bottom: 45,
                    left: 10,
                    child: Text(
                      videoCurrentTime,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    bottom: 52,
                    right: 90,
                    left: 90,
                    child: VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        backgroundColor: Colors.grey,
                        playedColor: Colors.deepPurple,
                        bufferedColor: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Actions(
                          actions: <Type, Action<Intent>>{
                            EnterButtonIntent:
                                CallbackAction<EnterButtonIntent>(
                                    onInvoke: (Intent) {
                              return videoSeek(-5);
                            }),
                            RightButtonIntent:
                                CallbackAction<RightButtonIntent>(
                                    onInvoke: (Intent) {
                              return _changeFocus(context, _playFocusNode!);
                            }),
                            LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                                onInvoke: (Intent) {
                              return _changeFocus(context, _previousScreen!);
                            }),
                          },
                          child: Focus(
                            focusNode: _BackwardFocusNode,
                            child: IconButtonSection(
                              size: 40,
                              onPressed: () {
                                videoSeek(-5);
                              },
                              icon: Icons.fast_rewind,
                              iconColor: !_BackwardFocusNode!.hasFocus
                                  ? Colors.blue
                                  : Colors.red,
                            ),
                          ),
                        ),
                        Actions(
                          actions: <Type, Action<Intent>>{
                            EnterButtonIntent:
                                CallbackAction<EnterButtonIntent>(
                                    onInvoke: (Intent) {
                              return clickPlayButton();
                            }),
                            RightButtonIntent:
                                CallbackAction<RightButtonIntent>(
                                    onInvoke: (Intent) {
                              return _changeFocus(context, _stopFocusNode!);
                            }),
                            LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                                onInvoke: (Intent) {
                              return _changeFocus(context, _BackwardFocusNode!);
                            }),
                          },
                          child: Focus(
                            focusNode: _playFocusNode,
                            child: IconButtonSection(
                              size: 40,
                              onPressed: () {
                                clickPlayButton();
                              },
                              icon: _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              iconColor: !_playFocusNode!.hasFocus
                                  ? Colors.blue
                                  : Colors.red,
                            ),
                          ),
                        ),
                        Actions(
                          actions: <Type, Action<Intent>>{
                            EnterButtonIntent:
                                CallbackAction<EnterButtonIntent>(
                                    onInvoke: (Intent) {
                              return clickStopButton();
                            }),
                            RightButtonIntent:
                                CallbackAction<RightButtonIntent>(
                                    onInvoke: (Intent) {
                              return _changeFocus(context, _forwardFocusNode!);
                            }),
                            LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                                onInvoke: (Intent) {
                              return _changeFocus(context, _playFocusNode!);
                            }),
                          },
                          child: Focus(
                            focusNode: _stopFocusNode,
                            child: IconButtonSection(
                              size: 40,
                              onPressed: () {
                                clickStopButton();
                              },
                              icon: Icons.stop,
                              iconColor: !_stopFocusNode!.hasFocus
                                  ? Colors.blue
                                  : Colors.red,
                            ),
                          ),
                        ),
                        Actions(
                          actions: <Type, Action<Intent>>{
                            EnterButtonIntent:
                                CallbackAction<EnterButtonIntent>(
                                    onInvoke: (Intent) {
                              return videoSeek(5);
                            }),
                            RightButtonIntent:
                                CallbackAction<RightButtonIntent>(
                                    onInvoke: (Intent) {
                              return _changeFocus(context, _previousScreen!);
                            }),
                            LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                                onInvoke: (Intent) {
                              return _changeFocus(context, _stopFocusNode!);
                            }),
                          },
                          child: Focus(
                            focusNode: _forwardFocusNode,
                            child: IconButtonSection(
                              size: 40,
                              onPressed: () {
                                videoSeek(5);
                              },
                              icon: Icons.fast_forward,
                              iconColor: !_forwardFocusNode!.hasFocus
                                  ? Colors.blue
                                  : Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ])
              : const Center(
                  child: CircularProgressIndicator(color: Colors.grey),
                ),
        ),
      ),
    );
  }

  loadVideoPlayer1() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://player.vimeo.com/external/802188242.m3u8?s=1ccb16987e287cd501b9dff9e1edd9242a4efe6d"),
    );
    _controller.addListener(getDuration);
    _controller.initialize().then((value) {
      _controller.play();
      if (mounted) {
        setState(() {});
      }
    });
  }

  getDuration() {
    var position = Duration(
        milliseconds: _controller.value.position.inMilliseconds.round());
    var duration = Duration(
        milliseconds: _controller.value.duration.inMilliseconds.round());
    videoDuration = [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');

    videoCurrentTime = [
      position.inHours,
      position.inMinutes,
      position.inSeconds
    ].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');

    if (_controller.value.position == _controller.value.duration) {
      clickStopButton();
    } else {
      if (mounted) {
        setState(() {});
      }
    }
  }

  void clickPlayButton() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    if (mounted) {
      setState(() {});
    }
  }

  void clickStopButton() {
    _controller.seekTo(const Duration(seconds: 0));
    if (mounted) {
      setState(() {});
    }
  }

  void videoSeek(int time) {
    Duration currentPosition = _controller.value.position;
    Duration targetPosition = currentPosition + Duration(seconds: time);
    _controller.seekTo(targetPosition);
  }
}
