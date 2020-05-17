import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';

class AudioTools extends StatefulWidget {
  AudioTools(
      {Key key,
      this.audioPlayer,
      this.isPlaying,
      this.firstTime,
      this.currentTime,
      this.completeTime})
      : super(key: key);
   AudioPlayer audioPlayer;
   bool isPlaying;
   bool firstTime;
   String currentTime;
   String completeTime;
  @override
  _AudioToolsState createState() => _AudioToolsState();
}

class _AudioToolsState extends State<AudioTools> {
  get audioPlayer => widget.audioPlayer;
  get completeTime => widget.completeTime;
  get currentTime => widget.currentTime;
  get isPlaying => widget.completeTime;
  get firstTime => widget.completeTime;

  set firstTime(bool firstTime) {}
  set completeTime(String completeTime) {}
  set currentTime(String currentTime) {}
  set isPlaying(bool isPlaying) {}

  set audioPlayer(AudioPlayer audioPlayer) {}

  @override
  void dispose() {
    widget.audioPlayer.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    widget.audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        this.currentTime = duration.toString().split(".")[0];
      });
    });

    widget.audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        this.completeTime = duration.toString().split(".")[0];
      });
    });
  }

  void startPlayingFromScratch(String filePath) async {
    // String filePath = "audios/meditate.mp3";
    final cache = AudioCache();

    this.audioPlayer = await cache.play(filePath);
    debugPrint(filePath);
    setState(() {
      this.firstTime = true;
      this.isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

}

