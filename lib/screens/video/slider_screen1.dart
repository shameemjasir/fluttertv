import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertv/models/channel_model.dart';
import 'package:fluttertv/screens/video/player_controls.dart';
import 'package:fluttertv/utils/action_handler.dart';

class SliderScreen1 extends StatefulWidget {
  const SliderScreen1({super.key});

  @override
  State<SliderScreen1> createState() => _SliderScreen1State();
}

class _SliderScreen1State extends State<SliderScreen1> {
  List<Channels> channnelList = [];
  bool isLoading = true;
  final ScrollController _scrollController = ScrollController();
  FocusNode focusNodeList = FocusNode();
  FocusNode focusNodeFirstItem = FocusNode();

  void getData() async {
    String pageData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/Home_TVapplication.json");

    var decodedData = jsonDecode(pageData);
    print(decodedData);

    if (decodedData["channels"] != null) {
      channnelList = (decodedData["channels"] as List)
          .map((value) => Channels.fromJson(value))
          .toList();

      // channnelList.forEach((element) {
      //   print(element.poster.trailer.url);
      // });
      //  print(channnelList[1].image);

      isLoading = false;
      // if (isLoading == false) {
      //   setState(() {});
      // }

      if (mounted) {
        setState(() {});
      }
    }
  }

  void _setFirstFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNodeList);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    focusNodeFirstItem.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    // _setFirstFocus(context);
    return ActionHandler().handleArrowsandEnterActions(
      child: Column(
        children: [
          Focus(
            focusNode: focusNodeList,
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 200,
                child: channnelList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: channnelList.length,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return Card(
                            color: Colors.black,
                            child: InkWell(
                              customBorder: const RoundedRectangleBorder(
                                  // borderRadius: BorderRadius.circular(20),
                                  ),
                              focusColor:
                                  const Color.fromARGB(255, 251, 255, 1),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlayerControls(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Image.network(
                                    channnelList[index].image,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
