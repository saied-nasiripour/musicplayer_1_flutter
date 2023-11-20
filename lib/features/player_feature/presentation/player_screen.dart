import 'package:flutter/material.dart';
import 'package:musicplayer_1_flutter/core/constants/color_palette.dart';
import 'package:musicplayer_1_flutter/features/player_feature/presentation/widgets/neumorphism_button.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
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
              const NeumorphismButton(
                size: 60,
                imageUrl: "assets/images/1.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
