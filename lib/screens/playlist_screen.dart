import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/playllist_model.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayList playlists = Get.arguments as PlayList;
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Playlist'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _PlaylistInformation(playlists: playlists),
                const SizedBox(
                  height: 30.0,
                ),
                const _PlayorShufferSwitch(),
                _PlaylistSong(playlists: playlists)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistSong extends StatefulWidget {
  const _PlaylistSong({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final PlayList playlists;

  @override
  State<_PlaylistSong> createState() => _PlaylistSongState();
}

class _PlaylistSongState extends State<_PlaylistSong> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.playlists.songs
            .map((song) => InkWell(
                  onTap: () {
                    Get.toNamed('/song', arguments: song);
                  },
                  child: Container(
                    height: 75.0,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 253, 99, 217)
                          .withOpacity(0.8),
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
                                style: Theme.of(context).textTheme.bodySmall!,
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
                ))
            .toList(),
      ],
    );
  }
}

class _PlayorShufferSwitch extends StatefulWidget {
  const _PlayorShufferSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayorShufferSwitch> createState() => _PlayorShufferSwitchState();
}

class _PlayorShufferSwitchState extends State<_PlayorShufferSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30.0),
        height: 50.0,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: isPlay ? 0 : width * 0.45,
              child: Container(
                height: 50.0,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.pink.shade400,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                              color: isPlay ? Colors.white : Colors.pinkAccent,
                              fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.pinkAccent,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Shuffer',
                          style: TextStyle(
                              color: isPlay ? Colors.pinkAccent : Colors.white,
                              fontSize: 20.0),
                        ),
                      ),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.pinkAccent : Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaylistInformation extends StatelessWidget {
  const _PlaylistInformation({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final PlayList playlists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            playlists.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          playlists.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
