import 'song_model.dart';

class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  PlayList({required this.title, required this.songs, required this.imageUrl});

  static List<PlayList> playlists = [
    PlayList(
        title: "Despacito",
        songs: Song.songs,
        imageUrl: "assets/images/despacitoalbum2.jpg"),
    PlayList(
        title: "Hãy trao cho anh",
        songs: Song.songs,
        imageUrl: "assets/images/Hay-Trao-Cho-Anh.jpg"),
    PlayList(
        title: "Lạc trôi",
        songs: Song.songs,
        imageUrl: "assets/images/Lac_troi_single_sontungmtp.jpg"),
    PlayList(
        title: "Making My Way",
        songs: Song.songs,
        imageUrl: "assets/images/1683254769200_640.jpg"),
    PlayList(
        title: "Ngủ một mình",
        songs: Song.songs,
        imageUrl: "assets/images/1668568582316_640.jpg"),
  ];
}
