import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertv/screens/video/playing_screen.dart';

 class LeftButtonIntent extends Intent{}
 class RightButtonIntent extends Intent{}
class UpButtonIntent extends Intent{}
class DownButtonIntent extends Intent{}
class EnterButtonIntent extends Intent {}

class Home extends StatefulWidget {
  const Home({super.key});



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FocusNode _playButtonFocusNode = FocusNode();
  final FocusNode _carouselFocusNode = FocusNode();
  final IconData _selectdIcon = Icons.laptop;
  FocusNode? _icon1FocusNode;
  FocusNode? _icon2FocusNode;
  FocusNode? _icon3FocusNode;
  FocusNode? _icon4FocusNode;

  @override
  void initState() {
    // _playButtonFocusNode.requestFocus();
    super.initState();
  }

  void _setFirstFocus(BuildContext context) {
    if (_icon1FocusNode == null) {
      _icon1FocusNode = FocusNode();
      _icon2FocusNode = FocusNode();
      _icon3FocusNode = FocusNode();
      _icon4FocusNode = FocusNode();
    }
    FocusScope.of(context).requestFocus(_icon1FocusNode);
  }

  void _changeFocus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _icon1FocusNode = FocusNode();
    _icon2FocusNode = FocusNode();
    _icon3FocusNode = FocusNode();
    _icon4FocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    if (_icon1FocusNode == null) {
      _setFirstFocus(context);
    }

    return Container(
      color: const Color.fromARGB(255, 252, 252, 252),
      child: Padding(
        padding: const EdgeInsets.only(left: 200, top: 100),
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.arrowLeft):  LeftButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowUp):    UpButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown):  DownButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.select):     EnterButtonIntent(),
          },
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    child: ElevatedButton.icon(
                      focusNode: _playButtonFocusNode,
                      onPressed: () {
                        print('object');
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
                      focusNode: _carouselFocusNode,
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
              const SizedBox(height: 10),
              Expanded(
                child: Icon(
                  _selectdIcon,
                  size: 100,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: !_icon1FocusNode!.hasFocus
                        ? null
                        : BoxDecoration(
                            border: Border.all(
                              width: 5,
                              color: const Color.fromARGB(255, 41, 141, 255),
                            ),
                          ),
                    child: const Icon(
                      Icons.laptop,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Focus(
                    focusNode: _icon2FocusNode,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: !_icon2FocusNode!.hasFocus
                            ? null
                            : Border.all(
                                width: 5,
                                color: const Color.fromARGB(255, 41, 141, 255),
                              ),
                      ),
                      child: const Icon(
                        Icons.desktop_windows,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Focus(
                    focusNode: _icon3FocusNode,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: !_icon3FocusNode!.hasFocus
                            ? null
                            : Border.all(
                                width: 5,
                                color: const Color.fromARGB(255, 41, 141, 255),
                              ),
                      ),
                      child: const Icon(
                        Icons.desktop_mac,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Focus(
                    focusNode: _icon4FocusNode,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: !_icon4FocusNode!.hasFocus
                            ? null
                            : Border.all(
                                width: 5,
                                color: const Color.fromARGB(255, 41, 141, 255),
                              ),
                      ),
                      child: const Icon(
                        Icons.tablet_android,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
