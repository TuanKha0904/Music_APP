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
        title: "Lofi Chill",
        songs: Song.songs,
        imageUrl:
            "assets/images/lofi-chill-anime-girl-4K-wallpaper-pc-preview.jpg"),
    PlayList(
        title: "EDM",
        songs: Song.songs,
        imageUrl: "assets/images/edm-118.jpg.crdownload"),
    PlayList(
        title: "Vinahouse",
        songs: Song.songs,
        imageUrl: "assets/images/unnamed (1).jpg"),
    PlayList(
        title: "Trap Music Mix",
        songs: Song.songs,
        imageUrl: "assets/images/trapmusicjulyedition.jpg.crdownload"),
  ];
}
