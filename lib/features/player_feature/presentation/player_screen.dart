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
  int _currentItemPlaying = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NeumorphismButton(
                    size: 60,
                    child: Icon(
                      Icons.favorite_border,
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
            ],
          ),
        ),
      ),
    );
  }
}
