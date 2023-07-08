import 'package:flutter/material.dart';

import '../models/song_model.dart';
import '../screens/favorites_screen.dart';

class MucsicInfor extends StatefulWidget {
  const MucsicInfor({
    Key? key,
    required this.song,
    required this.addSong,
    required this.removeSong,
  }) : super(key: key);

  final Song song;
  final void Function(Song song) addSong;
  final void Function(Song song) removeSong;

  @override
  State<MucsicInfor> createState() => _MucsicInforState();
}

class _MucsicInforState extends State<MucsicInfor> {
  bool isFavorite = false;
  bool _checkFavoriteStatus() {
    return FavoriteScreen.favoriteSong.contains(widget.song);
  }

  @override
  void initState() {
    super.initState();
    isFavorite = _checkFavoriteStatus();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.addSong(widget.song);
      } else {
        widget.removeSong(widget.song);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.song.title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.song.author,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: GestureDetector(
            onTap: toggleFavorite,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_outline,
              size: 40.0,
              color: isFavorite ? Colors.red : Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
