import 'package:flutter/material.dart';
import '../models/song_model.dart';

class ImageMusicRound extends StatelessWidget {
  const ImageMusicRound({
    Key? key,
    required AnimationController animationController,
    required this.song,
  })  : _animationController = animationController,
        super(key: key);

  final AnimationController _animationController;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 300.0),
      child: Align(
        alignment: Alignment.center,
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: ClipOval(
            child: SizedBox(
              width: 300.0,
              height: 300.0,
              child: Stack(
                children: [
                  Image.asset(
                    song.coverUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
