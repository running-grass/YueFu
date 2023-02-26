import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:yue_fu/providers/five_sing.dart';
import 'package:yue_fu/providers/types/music.dart';
import 'package:yue_fu/screens/commons/player_buttons.dart';

import 'commons/audio_metadata.dart';
import 'commons/playlist.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late final AudioPlayer _audioPlayer = AudioPlayer();

  late final Future<List<Song>> _songs = getSongs();

  Future<List<Song>> getSongs() async {
    final qian = FiveSing();
    final lis = await qian.getRankingList();
    final details = await qian.getRankingDetail(lis.first);
    return details.songs;
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // _songs = getSongs();
  //   _audioPlayer = AudioPlayer();
  // }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: FutureBuilder(
          future: _songs,
          builder: (context, snapshot) {
            final audios = snapshot.data
                    ?.map(
                      (e) => AudioSource.uri(
                        Uri.parse(e.id),
                        tag: e,
                      ),
                    )
                    .toList() ??
                [];
            _audioPlayer
                .setAudioSource(ConcatenatingAudioSource(children: audios));
            return Column(
              children: [
                Expanded(child: Playlist(_audioPlayer)),
                PlayerButtons(_audioPlayer),
              ],
            );
          },
        )),
      ),
    );
  }
}
