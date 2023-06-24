import 'package:flutter/material.dart';
import 'package:fluttertv/screens/video/playing_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final FocusNode _playButtonFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 252, 252),
      child: Padding(
        padding: const EdgeInsets.only(left: 200, top: 100),
        child: Row(
          children: [
            SizedBox(
              child: ElevatedButton.icon(
                focusNode: _playButtonFocusNode,
                onPressed: () {
                  // Respond to button press
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text("PlayingScreen"),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              child: ElevatedButton.icon(
                
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlayingScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text("CarouselScreen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
