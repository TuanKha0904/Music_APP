import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../models/song_model.dart';
import '../widgets/widgets.dart';
import 'package:get/get.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> with TickerProviderStateMixin {
  AudioPlayer audioPlayer = AudioPlayer();
  late AnimationController _animationController;
  Song song = Get.arguments ?? Song.songs[0];
  bool isPlay = false;

  @override
  void initState() {
    super.initState();

    List<AudioSource> audioSources = Song.songs
        .map((song) => AudioSource.uri(Uri.parse('asset:///${song.url}')))
        .toList();

    audioPlayer.setAudioSource(ConcatenatingAudioSource(
      children: audioSources,
      shuffleOrder: DefaultShuffleOrder(),
      useLazyPreparation: true,
    ));

    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    audioPlayer.playerStateStream.listen((PlayerState state) {
      setState(() {
        isPlay = state.playing;
        if (isPlay) {
          _animationController.repeat();
        } else {
          _animationController.stop();
        }
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundFilter(),
          ImageMusicRound(
              animationController: _animationController, song: song),
          const SizedBox(height: 10.0),
          MusicPlayer(
            song: song,
            seekBarDataStream: _seekBarDataStream,
            audioPlayer: audioPlayer,
            animationController: _animationController,
          ),
        ],
      ),
    );
  }
}
