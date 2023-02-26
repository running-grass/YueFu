import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Set a sequence of audio sources that will be played by the audio player.
    _audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(
        Uri.parse(
            "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3"),
        tag: AudioMetadata(
          title: "Tristram",
          artwork:
              "https://upload.wikimedia.org/wikipedia/en/3/3a/Diablo_Coverart.png",
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
        tag: AudioMetadata(
          title: "The secret of Monkey Island - Introduction",
          artwork:
              "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
        tag: AudioMetadata(
          title: "The secret of 111111",
          artwork:
              "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
        tag: AudioMetadata(
          title: "The secret of 22222",
          artwork:
              "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
        tag: AudioMetadata(
          title: "The secret of 33333",
          artwork:
              "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
        ),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
        tag: AudioMetadata(
          title: "The secret of 44444",
          artwork:
              "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
        ),
      ),
    ]))
        .catchError((error) {
      return const Duration(seconds: 1);
    });
  }

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
          child: Column(
            children: [
              Expanded(child: Playlist(_audioPlayer)),
              PlayerButtons(_audioPlayer),
            ],
          ),
        ),
      ),
    );
  }
}
