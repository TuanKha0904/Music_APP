import 'package:flutter/material.dart';

import '../models/playllist_model.dart';
import '../models/song_model.dart';
import '../widgets/playlist_cart.dart';
import '../widgets/section_header.dart';
import '../widgets/song_cart.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<PlayList> playlists = PlayList.playlists;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color.fromARGB(255, 228, 14, 156).withOpacity(0.8),
            const Color.fromARGB(255, 230, 129, 213).withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const _DiscoverMusic(),
              TrendingMusic(songs: songs),
              _PlayListMusic(playlists: playlists)
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayListMusic extends StatelessWidget {
  const _PlayListMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<PlayList> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlist'),
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20.0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                return PlaylistCard(playlist: playlists[index]);
              })
        ],
      ),
    );
  }
}

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return SongCard(song: songs[index]);
                }),
          )
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            const Color.fromARGB(255, 216, 83, 194).withOpacity(0.8),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/search');
          } else if (index == 2) {
            Get.toNamed('/favorite');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favorites'),
        ]);
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'TK Music Player',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
