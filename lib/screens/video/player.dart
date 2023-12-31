import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late VideoPlayerController _controller;
  String videoDuration = "";
  String videoCurrentTime = "";

  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }

  loadVideoPlayer() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://player.vimeo.com/external/801505110.m3u8?s=d3e8fa79ae737d234387db6db7c7bf57edb4a4e6"));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
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
