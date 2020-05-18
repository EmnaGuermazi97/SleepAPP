import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioTools {
  AudioPlayer audioPlayer;
  bool isPlaying;
  bool firstTime;
  String currentTime;
  String completeTime;

  AudioTools(
      {this.audioPlayer,
      this.isPlaying,
      this.firstTime,
      this.currentTime,
      this.completeTime});

  void startPlayingFromScratch(String filePath) async {
    final cache = AudioCache();

    this.audioPlayer = await cache.play(filePath);
    debugPrint(filePath);
    setState(() {
      this.firstTime = true;
      this.isPlaying = true;
    });
  }
}
