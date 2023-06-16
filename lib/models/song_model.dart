class Song {
  final String title;
  final String author;
  final String url;
  final String coverUrl;
  Song(
      {required this.title,
      required this.author,
      required this.url,
      required this.coverUrl});

  static List<Song> songs = [
    Song(
        title: "Despacito",
        author: " Luis Fonsi ",
        url: "assets/songs/DespacitoSaxophoneNhacHay360.mp3",
        coverUrl: "assets/images/despacitoalbum2.jpg"),
    Song(
        title: "Hãy trao cho anh",
        author: "Sơn Tùng MTP",
        url: "assets/songs/HayTraoChoAnhSonTungMTPSnoopDoggNhacHay360.mp3",
        coverUrl: "assets/images/Hay-Trao-Cho-Anh.jpg"),
    Song(
        title: "Lạc trôi",
        author: "Sơn Tùng MTP",
        url: "assets/songs/LacTroiRemixTiktokSonTungMTP.mp3",
        coverUrl: "assets/images/Lac_troi_single_sontungmtp.jpg"),
    Song(
        title: "Making My Way",
        author: "Sơn Tùng MTP",
        url: "assets/songs/makingmywaysontungmtp.mp3",
        coverUrl: "assets/images/1683254769200_640.jpg"),
    Song(
        title: "Ngủ một mình",
        author: "Hiếu thứ hai",
        url: "assets/songs/ngumotminhHIEUTHUHAINegavKewtiieNhacHay360.mp3",
        coverUrl: "assets/images/1668568582316_640.jpg"),
  ];
}
