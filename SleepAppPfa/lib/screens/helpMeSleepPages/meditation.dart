import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_test/widgets/customNavBar.dart';

class MeditationPage extends StatefulWidget {
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<MeditationPage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool firstTime = true;

  String currentTime = "00:00";
  String completeTime = "00:00";
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
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  void startPlayingFromScratch() async {
    String filePath = "audios/meditate.mp3";
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
      appBar: AppBar(
        leading: Container(),
        title: Text("Meditate"),
        centerTitle: true,
      ),
      bottomNavigationBar: customNavBar(context, 0),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[50],
                image: DecorationImage(
                  image: AssetImage("assets/images/relaxation-png-1.png"),
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
                      color: Colors.orange[100],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange[100].withOpacity(0.5),
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
                      Text(
                        currentTime,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(" | "),
                      Text(
                        completeTime,
                        style: TextStyle(fontWeight: FontWeight.w300),
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
