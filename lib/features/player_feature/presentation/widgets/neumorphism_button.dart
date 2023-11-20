import 'package:flutter/material.dart';
import 'package:musicplayer_1_flutter/core/constants/color_palette.dart';

class NeumorphismButton extends StatelessWidget {
  final double size;
  final Widget? child;
  final VoidCallback? onPressed;
  final double blur;
  final double distance;
  final List<Color>? colors;
  final String? imageUrl;

  const NeumorphismButton({
    super.key,
    required this.size,
    this.child,
    this.onPressed,
    this.blur = 20,
    this.distance = 10,
    this.colors,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          /*color: Colors.black,*/
          color: colors == null ? ColorPalette.bgColor : colors![1],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              /*color: Colors.blue,*/
              color: ColorPalette.white,
              blurRadius: blur,
              offset: Offset(-distance, -distance),
            ),
            BoxShadow(
              /*color: Colors.red,*/
              color: ColorPalette.bgDark,
              blurRadius: blur,
              offset: Offset(distance, distance),
            ),
          ]),
      child: imageUrl != null
          ? CircleAvatar(
              backgroundImage: AssetImage(imageUrl!),
            )
          : Container(
              decoration: BoxDecoration(
                /*color: Colors.red,*/
                color: ColorPalette.bgColor,
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors ??
                      [
                        ColorPalette.white,
                        ColorPalette.bgDark,
                      ],
                ),
              ),
              child: child,
            ),
    );
  }
}
