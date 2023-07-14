import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    loadVideoPlayer1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _controller.value.isInitialized
            ? Stack(children: [
                VideoPlayer(_controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
                Positioned(
                  left: 10,
                  child: IconButtonSection(
                    size: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back,
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
                      IconButtonSection(
                        size: 40,
                        onPressed: () {
                          videoSeek(-5);
                        },
                        icon: Icons.fast_rewind,
                      ),
                      IconButtonSection(
                        size: 40,
                        onPressed: () {
                          clickPlayButton();
                        },
                        icon: _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      IconButtonSection(
                        size: 40,
                        onPressed: () {
                          clickStopButton();
                        },
                        icon: Icons.stop,
                      ),
                      IconButtonSection(
                        size: 40,
                        onPressed: () {
                          videoSeek(5);
                        },
                        icon: Icons.fast_forward,
                      )
                    ],
                  ),
                )
              ])
            : const Center(
                child: CircularProgressIndicator(color: Colors.grey),
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
