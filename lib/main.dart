import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app1/screens/home_screen.dart';
import 'package:music_app1/screens/playlist_screen.dart';
import 'package:music_app1/screens/song_screen.dart';
import 'package:music_app1/screens/search_screen.dart';
import 'package:music_app1/screens/favorites_screen.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.white)),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const SongScreen()),
        GetPage(name: '/playlist', page: () => const PlaylistScreen()),
        GetPage(name: '/search', page: () => const SearchScreen()),
        GetPage(name: '/favorite', page: () => const FavoriteScreen())
      ],
    );
  }
}
