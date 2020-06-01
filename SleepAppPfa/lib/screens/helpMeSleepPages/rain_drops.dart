import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class RainDropsSongPage extends StatefulWidget {
  @override
  _RainDropsSongPageState createState() => _RainDropsSongPageState();
}

class _RainDropsSongPageState extends State<RainDropsSongPage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool firstTime = true;
  @override
  void dispose() {
    _audioPlayer.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
      });
    });
  }

  void startPlayingFromScratch() async {
    String filePath = "audios/rain_drops.mp3";
    final cache = AudioCache();
    _audioPlayer = await cache.play(filePath);
    debugPrint(filePath);
    setState(() {
      firstTime = true;
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
           Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/rainDrops.jpg"),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 80,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.65,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[50].withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(3,0,), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () {
                          if (isPlaying) {
                            _audioPlayer.pause();

                            setState(() {
                              firstTime = false;
                              isPlaying = false;
                            });
                          } else {
                            if (!firstTime) {
                              _audioPlayer.resume();

                              setState(() {
                                firstTime = false;
                                isPlaying = true;
                              });
                            } else {
                              startPlayingFromScratch();
                            }
                          }
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      IconButton(
                        icon: Icon(Icons.stop),
                        onPressed: () {
                          _audioPlayer.stop();

                          setState(() {
                            isPlaying = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
