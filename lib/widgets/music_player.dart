import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app1/screens/favorites_screen.dart';
import 'package:music_app1/widgets/player_buttons.dart';
import 'package:music_app1/widgets/seekbar.dart';

import '../models/song_model.dart';
import 'music_infor.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key? key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
    required this.animationController,
  })  : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;
  final AnimationController animationController;

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MucsicInfor(
            song: widget.song,
            addSong: (Song song) {
              setState(() {
                FavoriteScreen.favoriteSong.add(song);
              });
            },
            removeSong: (Song song) {
              setState(() {
                FavoriteScreen.favoriteSong.remove(song);
              });
            },
          ),
          const SizedBox(height: 30.0),
          StreamBuilder<SeekBarData>(
            stream: widget._seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChangeEnd: widget.audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(
            audioPlayer: widget.audioPlayer,
          ),
        ],
      ),
    );
  }
}
