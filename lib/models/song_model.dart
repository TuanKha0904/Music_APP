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
    Song(
        title: "Ngôi sao cô đơn",
        author: "J97",
        url: "assets/songs/NgoiSaoCoDonJackJ977611601.mp3",
        coverUrl: "assets/images/maxresdefault.jpg"),
    Song(
        title: "Never",
        author: "V.A",
        url:
            "assets/songs/NeverProduce101Season235Boys5Concepts-VA-5015138.mp3",
        coverUrl: "assets/images/maxresdefault1.jpg"),
    Song(
        title: "Thu cuối",
        author: "Hằng, Yanbi, Mr.T",
        url:
            "assets/songs/ThuCuoiLiveVersion2023-HangBingBoongYanBiMrT-8809307.mp3",
        coverUrl: "assets/images/maxresdefault2.jpg"),
    Song(
        title: "Eyes",
        author: "GDUCKY",
        url: "assets/songs/Eyes-GDucky-6607399.mp3",
        coverUrl: "assets/images/maxresdefault3.jpg"),
    Song(
        title: "Muộn rồi sao còn",
        author: "Sơn Tùng MTP",
        url: "assets/songs/MuonRoiMaSaoCon-SonTungMTP-7011803.mp3",
        coverUrl:
            "assets/images/bc4c19695e64fa8464c04b339b9af258.1000x1000x1.jpg"),
  ];
}
