import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerOne extends StatefulWidget {
  const PlayerOne({super.key});

  @override
  State<PlayerOne> createState() => _PlayerOneState();
}

class _PlayerOneState extends State<PlayerOne> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    loadVideoPlayer1();
  }

  loadVideoPlayer1() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://player.vimeo.com/external/802188507.m3u8?s=ae4a720c77f5f3a6315973ecd6a9c9a4a07b2e09"),
    );

    _controller.initialize().then((value) {
      _controller.play();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : const Center(
                child: CircularProgressIndicator(color: Colors.grey),
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
