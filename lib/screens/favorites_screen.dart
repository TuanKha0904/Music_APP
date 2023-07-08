import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/song_model.dart';

class FavoriteScreen extends StatefulWidget {
  static List<Song> favoriteSong = [];
  const FavoriteScreen({Key? key, required List favoriteSong})
      : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8)
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Favorite Music',
                style: TextStyle(fontSize: 28.0),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: FavoriteScreen.favoriteSong.length,
                  itemBuilder: (context, index) {
                    final song = FavoriteScreen.favoriteSong[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/song', arguments: song);
                      },
                      child: Container(
                        height: 75.0,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 167, 74, 238)
                              .withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                song.coverUrl,
                                height: 50.0,
                                width: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    song.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    song.author,
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodySmall!,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )));
  }
}
