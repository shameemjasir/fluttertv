import 'package:flutter/material.dart';
import 'package:fluttertv/screens/video/playing_screen.dart';
import 'package:fluttertv/screens/video/slider_screen.dart';
import 'package:fluttertv/screens/video/slider_screen1.dart';
import 'package:fluttertv/utils/action_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IconData _selectdIcon = Icons.laptop;

  FocusNode? _playButtonFocusNode;
  FocusNode? _carouselFocusNode;
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
      _playButtonFocusNode = FocusNode();
      _carouselFocusNode = FocusNode();
      _icon1FocusNode = FocusNode();
      _icon2FocusNode = FocusNode();
      _icon3FocusNode = FocusNode();
      _icon4FocusNode = FocusNode();
    }
    FocusScope.of(context).requestFocus(_icon1FocusNode);
  }

  _changeFocus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _icon1FocusNode = FocusNode();
    _icon2FocusNode = FocusNode();
    _icon3FocusNode = FocusNode();
    _icon4FocusNode = FocusNode();
    super.dispose();
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
        child: ActionHandler().handleArrowsandEnterActions(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Actions(
                      actions: <Type, Action<Intent>>{
                        LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                            onInvoke: (Intent) {
                          _selectdIcon = Icons.tablet_android;
                          return _changeFocus(context, _icon4FocusNode!);
                        }),
                        RightButtonIntent: CallbackAction<RightButtonIntent>(
                            onInvoke: (Intent) {
                          _selectdIcon = Icons.image;
                          return _changeFocus(context, _carouselFocusNode!);
                        }),
                        UpButtonIntent:
                            CallbackAction<UpButtonIntent>(onInvoke: (Intent) {
                          _selectdIcon = Icons.desktop_windows;
                          return _changeFocus(context, _icon2FocusNode!);
                        }),
                        DownButtonIntent: CallbackAction<DownButtonIntent>(
                            onInvoke: (Intent) {
                          _selectdIcon = Icons.laptop;
                          return _changeFocus(context, _icon1FocusNode!);
                        }),
                      },
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: !_playButtonFocusNode!.hasFocus
                              ? null
                              : MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 13, 82, 139)),
                        ),
                        focusNode: _playButtonFocusNode,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SliderScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("InkwellFocusColor"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    child: Actions(
                      actions: <Type, Action<Intent>>{
                        LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                            onInvoke: (Intent) {
                          _selectdIcon = Icons.image;
                          return _changeFocus(context, _playButtonFocusNode!);
                        }),
                        RightButtonIntent: CallbackAction<RightButtonIntent>(
                            onInvoke: (Intent) {
                          _selectdIcon = Icons.tablet_android;
                          return _changeFocus(context, _icon4FocusNode!);
                        }),
                        UpButtonIntent:
                            CallbackAction<UpButtonIntent>(onInvoke: (Intent) {
                          _selectdIcon = Icons.desktop_windows;
                          return _changeFocus(context, _icon2FocusNode!);
                        }),
                        DownButtonIntent: CallbackAction<DownButtonIntent>(
                            onInvoke: (Intent) {
                          _selectdIcon = Icons.laptop;
                          return _changeFocus(context, _icon1FocusNode!);
                        }),
                      },
                      child: ElevatedButton.icon(
                        focusNode: _carouselFocusNode,
                        style: ButtonStyle(
                          backgroundColor: !_carouselFocusNode!.hasFocus
                              ? null
                              : MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 6, 117, 84)),
                        ),
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
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: Actions(
                      actions: const <Type, Action<Intent>>{},
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: !_playButtonFocusNode!.hasFocus
                              ? null
                              : MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 13, 82, 139)),
                        ),
                        focusNode: _playButtonFocusNode,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SliderScreen1(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("testing"),
                      ),
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
                  Actions(
                    actions: <Type, Action<Intent>>{
                      LeftButtonIntent:
                          CallbackAction<LeftButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.tablet_android;
                        return _changeFocus(context, _icon4FocusNode!);
                      }),
                      RightButtonIntent:
                          CallbackAction<RightButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.desktop_windows;
                        return _changeFocus(context, _icon2FocusNode!);
                      }),
                      UpButtonIntent:
                          CallbackAction<UpButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.play_arrow;
                        return _changeFocus(context, _playButtonFocusNode!);
                      }),
                      DownButtonIntent:
                          CallbackAction<DownButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.image;
                        return _changeFocus(context, _carouselFocusNode!);
                      }),
                    },
                    child: Focus(
                      focusNode: _icon1FocusNode,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: !_icon1FocusNode!.hasFocus
                            ? null
                            : BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color:
                                      const Color.fromARGB(255, 41, 141, 255),
                                ),
                              ),
                        child: const Icon(
                          Icons.laptop,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Actions(
                    actions: <Type, Action<Intent>>{
                      LeftButtonIntent:
                          CallbackAction<LeftButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.laptop;
                        return _changeFocus(context, _icon1FocusNode!);
                      }),
                      RightButtonIntent:
                          CallbackAction<RightButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.desktop_mac;
                        return _changeFocus(context, _icon3FocusNode!);
                      }),
                      UpButtonIntent:
                          CallbackAction<UpButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.play_arrow;
                        return _changeFocus(context, _playButtonFocusNode!);
                      }),
                      DownButtonIntent:
                          CallbackAction<DownButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.image;
                        return _changeFocus(context, _carouselFocusNode!);
                      }),
                    },
                    child: Focus(
                      focusNode: _icon2FocusNode,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: !_icon2FocusNode!.hasFocus
                              ? null
                              : Border.all(
                                  width: 5,
                                  color:
                                      const Color.fromARGB(255, 41, 141, 255),
                                ),
                        ),
                        child: const Icon(
                          Icons.desktop_windows,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Actions(
                    actions: <Type, Action<Intent>>{
                      LeftButtonIntent:
                          CallbackAction<LeftButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.desktop_windows;
                        return _changeFocus(context, _icon2FocusNode!);
                      }),
                      RightButtonIntent:
                          CallbackAction<RightButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.tablet_android;
                        return _changeFocus(context, _icon4FocusNode!);
                      }),
                      UpButtonIntent:
                          CallbackAction<UpButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.play_arrow;
                        return _changeFocus(context, _playButtonFocusNode!);
                      }),
                      DownButtonIntent:
                          CallbackAction<DownButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.image;
                        return _changeFocus(context, _carouselFocusNode!);
                      }),
                    },
                    child: Focus(
                      focusNode: _icon3FocusNode,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: !_icon3FocusNode!.hasFocus
                              ? null
                              : Border.all(
                                  width: 5,
                                  color:
                                      const Color.fromARGB(255, 41, 141, 255),
                                ),
                        ),
                        child: const Icon(
                          Icons.desktop_mac,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Actions(
                    actions: <Type, Action<Intent>>{
                      LeftButtonIntent:
                          CallbackAction<LeftButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.desktop_mac;
                        return _changeFocus(context, _icon3FocusNode!);
                      }),
                      RightButtonIntent:
                          CallbackAction<RightButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.laptop;
                        return _changeFocus(context, _icon1FocusNode!);
                      }),
                      UpButtonIntent:
                          CallbackAction<UpButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.play_arrow;
                        return _changeFocus(context, _playButtonFocusNode!);
                      }),
                      DownButtonIntent:
                          CallbackAction<DownButtonIntent>(onInvoke: (Intent) {
                        _selectdIcon = Icons.image;
                        return _changeFocus(context, _carouselFocusNode!);
                      }),
                    },
                    child: Focus(
                      focusNode: _icon4FocusNode,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: !_icon4FocusNode!.hasFocus
                              ? null
                              : Border.all(
                                  width: 5,
                                  color:
                                      const Color.fromARGB(255, 41, 141, 255),
                                ),
                        ),
                        child: const Icon(
                          Icons.tablet_android,
                          size: 40,
                        ),
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
