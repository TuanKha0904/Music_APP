import 'song_model.dart';

class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  PlayList({required this.title, required this.songs, required this.imageUrl});

  static List<PlayList> playlists = [
    PlayList(
        title: "Young Chill",
        songs: Song.songs,
        imageUrl: "assets/images/unnamed.jpg"),
    PlayList(
        title: "Young Chill",
        songs: Song.songs,
        imageUrl: "assets/images/unnamed.jpg"),
    PlayList(
        title: "Young Chill",
        songs: Song.songs,
        imageUrl: "assets/images/unnamed.jpg"),
    PlayList(
        title: "Young Chill",
        songs: Song.songs,
        imageUrl: "assets/images/unnamed.jpg"),
    PlayList(
        title: "Young Chill",
        songs: Song.songs,
        imageUrl: "assets/images/unnamed.jpg"),
  ];
}
