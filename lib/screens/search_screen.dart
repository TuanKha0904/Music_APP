import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/song_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
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
              'Search Music',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          body: const _DiscoverMusic(),
        ));
  }
}

class _DiscoverMusic extends StatefulWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  State<_DiscoverMusic> createState() => _DiscoverMusicState();
}

class _DiscoverMusicState extends State<_DiscoverMusic> {
  late String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey.shade500),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none))),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount:
                  Song.songs.length, // Số lượng bài hát trong model của bạn
              itemBuilder: (context, index) {
                final song = Song.songs[index];
                // Kiểm tra từ khoá tìm kiếm và hiển thị bài hát thỏa mãn
                if (song.title
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase())) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/song', arguments: song);
                    },
                    child: Container(
                      height: 75.0,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 112, 39, 160)
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
                  );
                } else {
                  return const SizedBox(); // Không hiển thị bài hát không phù hợp
                }
              },
            ),
          ),
          if (Song.songs.every((song) =>
              !song.title.toLowerCase().contains(searchQuery.toLowerCase())))
            Center(
              child: Text(
                'The Song Not Found',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
