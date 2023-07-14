import 'package:flutter/material.dart';
import 'package:fluttertv/screens/video/player.dart';
import 'package:fluttertv/screens/video/player_controls.dart';
import 'package:fluttertv/screens/video/player_one.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({super.key});

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  final FocusNode _playButtonFocusNode = FocusNode();

  @override
  void initState() {
    _playButtonFocusNode.requestFocus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            imageWidget(),
            //    Positioned(
            //   left: 10,
            //   child: IconButtonSection(
            //     size: 30,
            //     activeFocusNode: _currentFocus,
            //     focusNode: _backFocusNode,
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Icons.arrow_back,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.network(
              'https://www.hdwallpaperslife.com/wp-content/uploads/2020/06/ertugrul-ghazi.jpg',
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Post Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Post Type',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '1995',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Cassification',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      focusNode: _playButtonFocusNode,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Player(),
                          ),
                        );
                      },
                      child: const Text(
                        'PlayerOne',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FilledButton(
                      focusNode: _playButtonFocusNode,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlayerOne(),
                          ),
                        );
                      },
                      child: const Text(
                        'Player',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FilledButton(
                      focusNode: _playButtonFocusNode,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlayerControls(),
                          ),
                        );
                      },
                      child: const Text(
                        'Play with Controls',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
