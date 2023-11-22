import 'package:flutter/material.dart';
import 'package:musicplayer_1_flutter/core/constants/color_palette.dart';
import 'package:musicplayer_1_flutter/features/player_feature/presentation/widgets/neumorphism_button.dart';
import 'package:musicplayer_1_flutter/features/playlist_feature/data/models/musics_list_model.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final int _currentItemPlaying = 0;
  double _currentPlayback = 0.0;

  String formatPlayerTime(double time) {
    final min = time ~/ 60;
    final sec = time % 60;
    return "$min:${sec.toStringAsFixed(0).padRight(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeumorphismButton(
                    size: 60,
                    child: Icon(
                      musicsListModel[_currentItemPlaying].isFav
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ColorPalette.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "Playing now".toUpperCase(),
                    style: const TextStyle(
                        color: ColorPalette.secondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const NeumorphismButton(
                    size: 60,
                    child: Icon(
                      Icons.menu,
                      color: ColorPalette.secondaryTextColor,
                    ),
                  ),
                ],
              ),
              NeumorphismButton(
                size: size.width * 0.8,
                distance: 20,
                imageUrl: musicsListModel[_currentItemPlaying].imageUrl,
                padding: 10,
              ),
              Column(
                children: [
                  Text(
                    musicsListModel[_currentItemPlaying].name,
                    style: const TextStyle(
                        color: ColorPalette.primaryTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    musicsListModel[_currentItemPlaying].artist,
                    style: const TextStyle(
                        color: ColorPalette.secondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatPlayerTime(_currentPlayback),
                          style: const TextStyle(
                              color: ColorPalette.secondaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formatPlayerTime(
                                  musicsListModel[_currentItemPlaying].length)
                              .toString(),
                          style: const TextStyle(
                              color: ColorPalette.secondaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: _currentPlayback,
                    max: musicsListModel[_currentItemPlaying].length,
                    thumbColor: ColorPalette.blue,
                    activeColor: ColorPalette.blue,
                    inactiveColor: ColorPalette.bgDark,
                    onChanged: (value) {
                      setState(() {
                        _currentPlayback = value;
                      });
                    },
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphismButton(
                    size: 80,
                    child: Icon(
                      Icons.skip_previous_rounded,
                      color: ColorPalette.secondaryTextColor,
                      size: 45,
                    ),
                  ),
                  NeumorphismButton(
                    size: 80,
                    colors: [ColorPalette.blueTopDark, ColorPalette.blue],
                    child: Icon(
                      Icons.pause_rounded,
                      color: ColorPalette.white,
                      size: 45,
                    ),
                  ),
                  NeumorphismButton(
                    size: 80,
                    child: Icon(
                      Icons.skip_next_rounded,
                      color: ColorPalette.secondaryTextColor,
                      size: 45,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
